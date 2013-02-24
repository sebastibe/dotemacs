(require 'yasnippet)
(yas--initialize)
(setq yas/snippet-dirs '("~/.emacs.d/snippets"
                         "~/.emacs.d/el-get/yasnippet/snippets"
                         ))
(yas/global-mode 1)
(add-to-list 'ac-sources 'ac-source-yasnippet)
