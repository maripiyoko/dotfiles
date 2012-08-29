;; 以下は nxml-mode を無効にし psgml の xml-mode を有効にするための設定
(require 'nxml-mode)
(require 'psgml)

;; *.xml 文書は xml-mode で
(setq auto-mode-alist (cons (cons "\\.xml" 'xml-mode) auto-mode-alist))
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

(add-hook 'sgml-mode-hook
          '(lambda()
             (hs-minor-mode 1)))
(add-to-list 'hs-special-modes-alist
             '(sgml-mode
               "<!--\\|<[^/>]>\\|<[^/][^>]*[^/]>"
               ""
               "<!--"
               sgml-skip-tag-forward
               nil))

;; key bind
(define-key sgml-mode-map (kbd "C-c C-o") 'hs-toggle-hiding)
(define-key sgml-mode-map (kbd "C-c C-l") 'hs-hide-level)
(define-key sgml-mode-map (kbd "C-c C-s") 'hs-show-all)