(require 'preamble-programming)

(setq
 my:el-get-python-packages
 '(elpy                                 ; better Python development environment
   python-pep8                          ; Python pep8 checker
   ein                                  ; ipython notebooks for emacs
;   pymacs                               ; pymacs (requires python packages)
;   ropemacs                             ; requires mercurial to be installed
))

(el-get 'sync my:el-get-python-packages)

(defun preamble-python-mode-defaults ()
  "Defaults for Python programming."
  (subword-mode +1)
  (electric-indent-mode -1)
  (setq elpy-rpc-backend "jedi"))

(setq preamble-python-mode-hook 'preamble-python-mode-defaults)

(add-hook 'python-mode-hook (lambda ()
                              (run-hooks 'preamble-python-mode-hook)))

(provide 'preamble-python)
