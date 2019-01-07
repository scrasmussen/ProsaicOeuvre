(require 'package)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t )
(package-initialize)


(require 'org)
(setq org-log-done t)
(defun my-org-mode-keys ()
  "My keys for org-mode"
  (interactive)
  (local-set-key "\C-cl" 'org-store-link)
  (local-set-key "\C-ca" 'org-agenda)
  (local-set-key [?\C-c ?\C-f]
    (message "** TODO "))
)
(add-hook 'org-mode-hook 'my-org-mode-keys)

;; (defun my-markdown-mode-keys ()
;;   "My keys for markdown-mode"
;;   (interactive)
;;   (local-set-key [?\C-x ?\C-x])
;;     TODO IF WHITESPACE REMOVE AND REPLACE WITH X
;; )

(require 'cl)
(require 'org-drill)
(setq org-drill-add-random-noise-to-intervals-p t)
(setq org-drill-learn-fraction 0.5)
(global-set-key (kbd "C-0") 'org-drill)

;; show column numbers
    (setq column-number-mode t)
;
; [tab] inserts two spaces
    (setq-default indent-tabs-mode nil)
    (global-set-key "\t" (lambda () (interactive) (insert-char 32 2)))
    (electric-indent-mode 0)

;; code folding
(global-set-key "\C-x$" 'set-selective-display-dlw)
            (defun set-selective-display-dlw (&optional level)
              "Toggle fold between 0 and 1."
              (interactive "P")
              (set-selective-display
                (if selective-display nil (or level 1))))

;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; https://github.com/joaotavora/autopair
(add-to-list 'load-path "/root/local/emacs") ;; comment if autopair.el is in standard load path
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(put 'upcase-region 'disabled nil)

(require 'org-brain)
(setq org-brain-path "/mnt/c/Users/Artless/Documents/unix/cranfield/org/brain")
