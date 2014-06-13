(require 'preamble-programming)

(setq
 my:el-get-js-packages
 '(
   js2-mode                             ; improved javascript mode
   js2-refactor                         ; javascript refactor
   swank-js                             ; interaction between js and emacs
))

(el-get 'sync my:el-get-js-packages)

(eval-after-load 'js-mode
  '(progn
     (defun preamble-js-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with js-mode
       (electric-layout-mode -1))

     (setq preamble-js-mode-hook 'preamble-js-mode-defaults)

     (add-hook 'js-mode-hook (lambda () (run-hooks 'preamble-js-mode-hook)))))

(provide 'preamble-js)
