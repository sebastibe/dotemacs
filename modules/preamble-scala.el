(require 'preamble-programming)

(setq
 my:el-get-python-packages
 '(scala-mode2))

(el-get 'sync my:el-get-scala-packages)

(defun preamble-scala-mode-defaults ()
  (subword-mode +1))

(setq preamble-scala-mode-hook 'preamble-scala-mode-defaults)

(add-hook 'scala-mode-hook (lambda ()
                             (run-hooks 'preamble-scala-mode-hook)))
(provide 'preamble-scala)
