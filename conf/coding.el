;;; smart-compile
(require 'smart-compile+)
(global-set-key "\C-cc" 'smart-compile)
(setq compilation-window-height 15) ;; デフォルトは画面の下半分

;;(add-to-list 'smart-run-alist ("\\.groovy$"      . "groovy %f"))


