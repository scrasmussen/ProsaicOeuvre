
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/column-enforce-mode")
(require 'column-enforce-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)
(add-hook 'LaTeX-mode-hook 'column-enforce-mode)

(load-theme 'doom-nord-light t)
(tool-bar-mode -1)
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

(setq visible-bell 1)
(setq inhibit-startup-screen t)
(setq column-number-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq default-frame-alist '((font . "Courier New-14")))

;; (set-frame-position (selected-frame) -10 0) ;; open on left side of laptop

(setq doc-view-ghostscript-program "C:/Program Files/gs/gs9.50/bin/gswin64.exe")

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fafafa" "#99324b" "#4f894c" "#9a7500" "#3b6ea8" "#97365b" "#398eac" "#2a2a2a"])
 '(custom-safe-themes
   (quote
    ("e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "a038af4fff7330f27f4baec145ef142f8ea208648e65a4b0eac3601763598665" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "72fda75af7caddec17ba9b49d2f99703c20a5f5f5c4dcec641d34a0b83569e88" "615123f602c56139c8170c153208406bf467804785007cdc11ba73d18c3a248b" default)))
 '(fci-rule-color "#9e9e9e")
 '(jdee-db-active-breakpoint-face-colors (cons "#fafafa" "#3b6ea8"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#fafafa" "#4f894c"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#fafafa" "#bdbdbd"))
 '(objed-cursor-color "#99324b")
 '(package-selected-packages (quote (doom-themes latex-preview-pane)))
 '(pdf-view-midnight-colors (cons "#2a2a2a" "#fafafa"))
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#4f894c")
    (cons 40 "#688232")
    (cons 60 "#817b19")
    (cons 80 "#9a7500")
    (cons 100 "#a0640c")
    (cons 120 "#a65419")
    (cons 140 "#ac4426")
    (cons 160 "#a53f37")
    (cons 180 "#9e3a49")
    (cons 200 "#97365b")
    (cons 220 "#973455")
    (cons 240 "#983350")
    (cons 260 "#99324b")
    (cons 280 "#a25467")
    (cons 300 "#ab7784")
    (cons 320 "#b49aa0")
    (cons 340 "#9e9e9e")
    (cons 360 "#9e9e9e")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)
(latex-preview-pane-enable)
(setq-default latex-preview-pane-multifile-mode 'auctex)

(add-hook 'LaTex-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)

;; (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer) ;; revert pdf after compile
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))) ;; use pdf-tools for viewing
;; (setq LaTeX-command "latex --synctex=1") ;; optional: enable synctex


;; ;;Eliminates the necessity for the save command before compilation is completed
;; (setq TeX-save-query nil)

;; ;;Function that combines two commands 1. revert pdfoutput buffer 2. pdf-outline
;; (defun my-TeX-revert-document-buffer (file)
;;   (TeX-revert-document-buffer file)
;;   (pdf-outline))

;; ;; Add custom function to the TeX compilation hook
;; (add-hook 'TeX-after-compilation-finished-functions #'my-TeX-revert-document-buffer)



;; (eval-after-load "tex"
;;   '(add-to-list
;;     'TeX-view-program-list
;;     '("preview-pane-mode"
;;       latex-preview-pane-mode)))

;; (add-hook 'LaTeX-mode-hook #'outline-minor-mode) ;; just this didn't work

;;   :ensure auctex
;;   :config
;;   (setq TeX-auto-save t
;;         TeX-parse-self t
;;         TeX-save-query nil)
;;   (setq-default TeX-master nil)
;;   :hook
;;   (LaTeX-mode . flyspell-mode)
;;   (LaTeX-mode . flyspell-buffer)
;;   (LaTeX-mode . tex-fold-mode)
;;   (LaTeX-mode . turn-on-reftex)
