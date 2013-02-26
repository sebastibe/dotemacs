;; Alt left/right are for moving through frames
(add-hook 'markdown-mode-hook
          (lambda ()
            (local-unset-key (kbd "M-<left>"))
            (local-unset-key (kbd "M-<right>"))
            ))
