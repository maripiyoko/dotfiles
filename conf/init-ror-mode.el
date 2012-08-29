;;; setting for Ruby on Rails

(require 'ido)
(ido-mode t)

;; rhtml mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
		  (lambda () (rinari-launch)))