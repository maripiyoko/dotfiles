;; emacs tcl mode
(autoload 'tcl-mode "tcl-mode")
(setq auto-mode-alist
      (append (list (cons "\\.tcl$" 'tcl-mode))
	      auto-mode-alist))
