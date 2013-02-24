;; Live completion with auto-complete
;; (see http://cx4a.org/software/auto-complete/)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; start autocompletion after 2 characters
(setq ac-auto-start 2)

;; ropemacs integration
(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
	  (lambda ()
	    (setq ac-sources (append ac-sources 'ac-source-ropemacs))))

;; add coffee-mode to auto-complete
(add-to-list 'ac-modes 'coffee-mode)
