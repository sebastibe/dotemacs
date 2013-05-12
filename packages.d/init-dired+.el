;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Don't show useless extensions in dired
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")
              (seq "~" eol)
              (seq bol "svn" eol)
              (seq ".pyc" eol)
              )))

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
