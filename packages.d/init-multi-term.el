(setq multi-term-program shell-file-name)

(global-set-key (kbd "C-c t") '(lambda ()
                                 (interactive)
                                 (if (get-buffer "*terminal<1>*")
                                     (switch-to-buffer "*terminal<1>*")
                                   (multi-term))))

(global-set-key (kbd "C-c n") 'multi-term-next)
(global-set-key (kbd "C-c p") 'multi-term-prev)
