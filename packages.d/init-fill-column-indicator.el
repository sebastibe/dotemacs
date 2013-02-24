(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(setq fci-rule-color "#ffffff")

;; turn on fci-mode automaticaly for some kind of files
(add-hook 'python-mode-hook 'auto-fci-mode)
(add-hook 'lisp-interaction-mode-hook 'auto-fci-mode)

(defun auto-fci-mode (&optional unused)
  (if (> (frame-width) 85)
      (fci-mode 1)
    (fci-mode 0))
)
