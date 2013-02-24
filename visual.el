(line-number-mode 1)			; have line numbers and
(column-number-mode 1)			; column numbers in the mode line

(tool-bar-mode -1)			; no tool bar with icons
(scroll-bar-mode -1)			; no scroll bars

(global-hl-line-mode)			; highlight current line
(global-linum-mode 1)			; add line numbers on the left

;; animation
(defconst animate-n-steps 8)
  (defun emacs-reloaded ()
    (animate-string (concat ";; Initialization successful, welcome to "
  			  (substring (emacs-version) 0 16)
			  ".")
		  0 0)
    (newline-and-indent)  (newline-and-indent))
  (add-hook 'after-init-hook 'emacs-reloaded)

(provide 'visual)
