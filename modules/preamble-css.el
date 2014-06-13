(require 'preamble-programming)

(setq
 my:el-get-css-packages
 '(less-css-mode                        ; to edit less css files (lesscss.org)
   rainbow-mode                         ; show color strings with a background color
   ))

(el-get 'sync my:el-get-css-packages)

(defun preamble-css-mode-defaults ()
  (setq css-indent-offset 2)
  (rainbow-mode +1))

(setq preamble-css-mode-hook 'preamble-css-mode-defaults)

(add-hook 'css-mode-hook (lambda ()
                           (run-hooks 'preamble-css-mode-hook)))

(provide 'preamble-css)
