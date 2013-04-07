(add-to-list 'shell-pop-internal-mode-list '("multi-term" "*terminal<1>*" '(lambda () (multi-term))))
(shell-pop-set-internal-mode "multi-term")

(shell-pop-set-internal-mode-shell shell-file-name)

(global-set-key [f8] 'shell-pop)
