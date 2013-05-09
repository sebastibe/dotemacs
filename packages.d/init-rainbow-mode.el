(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook less-css-mode))
  (add-hook hook 'rainbow-mode))
