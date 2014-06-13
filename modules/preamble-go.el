(require 'preamble-programming)

(setq
 my:el-get-go-packages
 '(go-mode                          ; Go
   go-autocomplete
))

(el-get 'sync my:el-get-go-packages)

(provide 'preamble-go)
