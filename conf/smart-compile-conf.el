(require 'smart-compile+)
(global-set-key "\C-cc" 'smart-compile)
(setq compilation-window-height 15) ;; デフォルトは画面の下半分

;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(when (featurep 'smart-compile)
    (setq smart-compile-alist
        '(("\\.c$"          . "g++ -o %n %f")
          ("\\.[Cc]+[Pp]*$" . "g++ -o %n %f")
          ("\\.java$"       . "javac %f")
          ("\\.php$"        . "php %f")
          ("\\.tex$"        . "latex %f")
          ("\\.l$"          . "lex -o %n.yy.c %f")
          ("\\.cron\\(tab\\)?\\'" . "crontab %f")
          ("\\.py$"         . "python %f")
          ("\\.sql$"        . "mysql < %f")
          ("\\.sh$"         . "./%f")
          ("\\.csh$"        . "./%f")
          ("\\.pl\\'"         . "perl -cw %f")
          ("\\.rb\\'"         . "ruby -cw %f")
		  ("\\.groovy$"     . "groovy \"%f\"")
          (emacs-lisp-mode  . (emacs-lisp-byte-compile))
         ))
    (setq smart-run-alist
          '(("\\.c$"          . "./%n")
            ("\\.[Cc]+[Pp]*$" . "./%n")
            ("\\.java$"       . "java %n")
            ("\\.php$"        . "php %f")
            ("\\.tex$"        . "dvisvga %n.dvi")
            ("\\.py$"         . "python %f")
            ("\\.pl$"         . "perl \"%f\"")
            ("\\.pm$"         . "perl \"%f\"")
            ("\\.bat$"        . "%f")
            ("\\.csh$"        . "./%f")
            ("\\.sh$"         . "./%f")
			("\\.groovy$"     . "groovy \"%f\"")
           ))
    (setq smart-executable-alist
          '("%n.class"
            "%n.exe"
            "%n"
            "%n.php"
            "%n.py"
            "%n.pl"
            "%n.bat"
            "%n.csh"
            "%n.sh"))
)

;; EOF
