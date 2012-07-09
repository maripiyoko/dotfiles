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
;(yes/global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)

;; auto-complete settings
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
			   "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-install settings
(when (require 'auto-install nil t)
  ;; set install directory
  (setq auto-install-directory "~/.emacs.d/elisp")
  ;; Emacswikiに登録されているelispの名前を取得する
  ;;(auto-install-update-emacswiki-package-name t)
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

;; load other configs
(load "conf/init-groovy")
(load "conf/init-tcl")
(load "conf/init-org-mode")
(load "conf/smart-compile-conf")
;(load "conf/init-xml-mode")

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdonw files" t)
(setq auto-mode-alist
      (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;; anything
;; (auto-install-batch "anything")
(when (require 'anything nil t)
  (setq
   ;; 候補を表示するまでの時間。デフォルト0.5
   anything-idle-delay 0.3
   ;; タイプして再描写するまでの時間。デフォルト0.1
   anything-input-idle-delay 0.2
   ;; 候補の最大表示数。デフォルト50
   anything-candidate-number-limit 100
   ;; 候補が多い時に、体感速度を早くする
   anything-quick-update t
   ;; 候補選択ショートカットをアルファベットに
   anything-enable-shortcut 'alphabet)

  (require 'anything-match-plugin nil t)

  (when (require 'anything-complete nil t)
	;; lispシンボルの補完候補の再検索時間
	(anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	(descbinds-anything-install))
)

;;; elisp setting
;;; 試行錯誤用ファイルを開くための設定
(require 'open-junk-file)
;; C-x C-zで試行錯誤用ファイルを開く
(global-set-key (kbd "C-x C-z") 'open-junk-file)
;;; 式の評価結果を注釈するための設定
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")
;; 釣り合いの取れる括弧のハイライト
(show-paren-mode 1)
;; 改行と同時にインデントも行う
(global-set-key "\C-m" 'newline-and-indent)
;; find-functionキーを割り当てる
(find-function-setup-keys)

;;; windmove
;;(windmove-default-keybindings 'meta) ; Alt の場合は meta を指定
;; Mac の Command + 矢印でウィンドウを移動する
(windmove-default-keybindings 'super)

