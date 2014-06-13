(defun preamble-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (preamble-enable-whitespace)
)

(setq which-func-unknown "n/a")

;; Show the current function name in the header line
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line, because it's mostly
      ;; invisible here anyway.
      (assq-delete-all 'which-func-mode mode-line-misc-info))

(setq preamble-prog-mode-hook 'preamble-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'preamble-prog-mode-hook)))

(provide 'preamble-programming)
