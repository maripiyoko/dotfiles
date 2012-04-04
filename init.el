;; Set load-path
(setq load-path (cons "~/.emacs.d" load-path))

;; load-pathを追加する関数定義
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-install settings
(when (require 'auto-install nil t)
  ;; set install directory
  (setq auto-install-directory "~/.emacs.d/elisp")
  ;; Emacswikiに登録されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;; basic setup
(setq inhibit-startup-message t)  ; don't show the startup message
(setq make-backup-files t)        ; make backup file
(setq visible-bell t)             ; don't beep
(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する

;; setting for max OSX emacs 23 for swap command key and meta key
(cond
 ((string-match "apple-darwin" system-configuration)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  )
)

;; frame opacity
(set-frame-parameter nil 'alpha 90)
(column-number-mode t)            ; display column number
(size-indication-mode t)          ; display file size
(global-set-key "\M-n" 'linum-mode) ; linum-mode on 

; timer settings
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)
(setq frame-title-format "%f") ; display file full path to title

(setq-default tab-width 4)
(setq-default transient-mark-mode t)

;; set colors
(set-face-foreground 'font-lock-string-face "purple")
(set-face-foreground 'font-lock-comment-face "MediumSeaGreen")
(set-face-foreground 'font-lock-keyword-face "blue")
(set-face-background 'region "LightGoldenrodYellow")

;; paren-mode : 対応する括弧を強調表示
(setq show-paren-delay 0) ; 表示までの秒数を0にする
(show-paren-mode t)
;; paren style
(setq show-paren-style 'expression)
;; change face
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; エスケープシーケンスに色を付ける
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; バッファ切り替え時に新しいバッファにカーソルを移動させる
(global-set-key "\C-x\C-b" 'buffer-menu-other-window)
(setq pop-up-windows nil)
;; 直前のバッファに切り替える
(defun switch-to-last-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))
(global-set-key (kbd "C-t") 'switch-to-last-buffer)

;; font settings
(set-face-attribute 'default nil
					:family "Menlo"
					:height 120)
(set-fontset-font
nil 'japanese-jisx0208
(font-spec :family "Osaka"))

;; git front end Egg setting
(when (executable-find "git")
  (require 'egg nil t))