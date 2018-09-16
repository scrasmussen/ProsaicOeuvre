org-capture

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(require 'cl)
(require 'org-drill)
(use-package org-drill
  :config (progn
            (add-to-list 'org-modules 'org-drill)
            (setq org-drill-random-noise-to-intervales-p t)
            (setq org-drill-hint-separator "||" )
            (setq org-drill-left-cloze-delimiter "<[" )
            (setq org-drill-right-cloze-delimiter "]>" )
            (setq org-drill-learn-fraction 0.5)
)
