(global-set-key (kbd "C-x g") 'magit-status)

;; load-magit-log-when-committing-mode
(define-minor-mode load-magit-log-when-committing-mode
  "dummy")

;; the hook
(defun show-magit-log-hook ()
  (cd "..")
  (magit-log)
  (switch-to-buffer-other-window "COMMIT_EDITMSG"))

;; add the hook
(add-hook 'load-magit-log-when-committing-mode-hook 'show-magit-log-hook)

;; load the mode for commit message
(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . load-magit-log-when-committing-mode))
