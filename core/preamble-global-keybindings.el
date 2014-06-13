;; Search Google
(global-set-key (kbd "M-ƒ") 'preamble-google)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'preamble-global-keybindings)
