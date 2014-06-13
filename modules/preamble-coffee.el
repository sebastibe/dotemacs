(require 'preamble-programming)

(setq
 my:el-get-coffee-packages
 '(coffee-mode                          ; CoffeeScript
))

(el-get 'sync my:el-get-coffee-packages)

(defun coffee-nav-forward-definition ()
  "Move forward to the next definition."
  (interactive)
  (if (save-excursion
        (forward-char 1)
        (re-search-forward "^\.*" nil t))
      (goto-char (match-beginning 1))
    (goto-char (point-max))))

(defun coffee-nav-backward-definition ()
  "Move backward to the previous definition."
  (interactive)
  (if (save-excursion
        (forward-char -1)
        (re-search-backward "^\.*" nil t))
      (goto-char (match-beginning 1))
    (goto-char (point-min))))

(eval-after-load 'coffee-mode
  '(progn
     (defun prelude-coffee-mode-defaults ()
       "coffee-mode-defaults"
       (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
       (define-key coffee-mode-map (kbd "M-n") 'coffee-nav-forward-definition)
       (define-key coffee-mode-map (kbd "M-p") 'coffee-nav-backward-definition)
)))



(provide 'preamble-coffee)
