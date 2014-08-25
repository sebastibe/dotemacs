(defcustom preamble-whitespace t
  "Non-nil values enable Prelude's whitespace visualization."
  :type 'boolean
  :group 'preamble)

(setq
 my:el-get-editor
 '(mark-multiple                        ; mark several regions at once
   expand-region                        ; increase selection by semantic units
   multiple-cursors                     ; multiple cursors
   smooth-scrolling                     ; smooth scorlling
   fill-column-indicator                ; draw a line at 80 char
   ace-jump-mode                        ; jump around in your file
   switch-window                        ; takes over C-x o
   goto-last-change                     ; explicit enough
   minimap                              ; a minimap sidebar for emacs
   find-file-in-project                 ; .git defined project C-x o
   browse-kill-ring                     ; browse kill ring C-x C-y
   dired+                               ; some more hooks fore dired
   auto-complete                        ; complete as you type with overlays
   yasnippet                            ; snippets
   string-inflection                    ; camelCase <-> camel_case
))

(el-get 'sync my:el-get-editor)

;; Only display trailing white space
(setq whitespace-style '(face tabs empty trailing lines-tail indentation::space))

(defun preamble-enable-whitespace ()
  "Enable `whitespace-mode' if `preamble-whitespace' is not nil."
  ;; keep the whitespace decent all the time (in this buffer)
  (add-hook 'before-save-hook 'whitespace-cleanup nil t)
  (whitespace-mode +1))

(add-hook 'text-mode-hook 'preamble-enable-whitespace)

(provide 'preamble-editor)
