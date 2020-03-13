;(setq custom-file "~/.emacs-custom.el")
;(load custom-file)
;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" .
"http://stable.melpa.org/packages/") t)
(package-initialize)
;;
;; Use R
;;(setq inferior-ess-r-program "R")
;; FIX THIS BY RESETTING WINDOWS PATH TO INCLUDE R/BIN FOLDER ;;
(setq inferior-ess-r-program "C:/Program Files/R/R-3.6.3/bin/x64/R.exe")
;;
;; Add support for knit and purl
(add-to-list 'load-path "~/.emacs.d/ess-knitr/")
;;(require 'ess-knitr)
;;
(require 'poly-R)
(eval-after-load 'ess-site
  '(progn 
     (add-to-list 'auto-mode-alist '("\\.[rR]md" . poly-markdown+r-mode))
     (add-to-list 'auto-mode-alist '("\\.[rR]nw" . poly-noweb+r-mode))))
;;
 (desktop-save-mode 1)
;;
;; AUCTeX stuff
(setq TeX-auto-save t)
(setq TeX-parse-self t)
; for adding master files etc,
; (setq-default TeX-master nil)
;;
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-toc-split-windows-horizontally t)
(setq reftex-toc-split-windows-fraction 0.2)
;;
;;(setq TeX-engine 'pdflatex)
;;
(setq TeX-PDF-mode t)
;; Sumatra
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list
'(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
   (mode-io-correlate " -forward-search %b %n ") " %o"))))
(eval-after-load 'tex
 '(progn
   (assq-delete-all 'output-pdf TeX-view-program-selection)
   (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))
(server-start)
;;
(set-face-attribute 'default nil :height 142 :weight 'bold)
;(set-face-attribute 'default nil :weight bold)
'(custom-enabled-themes (quote (adwaita)))
 '(desktop-save-mode t)
 '(doc-view-continuous t)
 '(latex-run-command "pdflatex")
 '(package-selected-packages (quote (gited org)))
 '(show-paren-mode t)

