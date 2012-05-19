;; org-mode settings
(setq org-startup-truncated nil)
(setq org-return-follows-link t)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(org-remember-insinuate)
(setq org-directory "~/memo/")
(setq org-default-notes-file (concat org-directory "agenda.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %?\n %i\n %a\n %t" nil "Inbox")
	("Bug" ?b "** TODO %? :bug:\n %i\n %a\n %t" nil "Inbox")
	("Idea" ?i "** %?\n %i\n %a\n %t" nil "New Ideas")
	))
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org" "~/org/study.org" "~/org/home.org"))
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))

;; org-mode to Markdown
(load "~/.emacs.d/site-lisp/org-export-generic.el")
(load "~/.emacs.d/ORGMODE-Markdown/markdown.el")

;; iCal sync settings
(setq org-icalender-include-todo t)

;; mobile-org settings
;; 編集するorgファイルの場所指定
(setq org-directory "~/org/Dropbox")
;; MobileOrg側で新しく作成したノートの保存するファイル名の指定
(setq org-mobile-inbox-for-pull "~/org/Dropbox/flagged.org")
;; Dropboxで同期するMobileOrgフォルダへのパス
(setq org-mobile-directory "~/org/Dropbox/MobileOrg")
;; 同期するファイルの指定
(setq org-agenda-files (quote ("~/org/Dropbox/test.org" "~/org/Dropbox/test.org")))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/work.org" "~/org/home.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; add setting for latex pdf
(setq org-latex-to-pdf-process
	  '("/Applications/UpTeX.app/teTeX/bin/dotexshop-utf8-nonstop %s"
		"/Applications/UpTeX.app/teTeX/bin/dotexshop-utf8-nonstop %s"))
