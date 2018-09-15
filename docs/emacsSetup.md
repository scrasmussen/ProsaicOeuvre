# EMACS
```
;; show column numbers
    (setq column-number-mode t)
```
* https://www.reddit.com/r/emacs/comments/32fqm3/make_tab_2_spaces_in_every_mode/
```
;; [tab] inserts two spaces
    (setq-default indent-tabs-mode nil)
    (global-set-key "\t" (lambda () (interactive) (insert-char 32 2)))
    (electric-indent-mode 0)
```
```
;; code folding
(global-set-key "\C-x$" 'set-selective-display-dlw)
            (defun set-selective-display-dlw (&optional level)
              "Toggle fold between 0 and 1."
              (interactive "P")
              (set-selective-display
                (if selective-display nil (or level 1))))
```
```
;; remove trailing whitespace
(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)
(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
        (delete-trailing-whitespace)))
```