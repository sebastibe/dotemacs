(require 'easymenu)

(defvar preamble-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c g") 'preamble-google)
    map)
  "Keymap for Preamble mode.")

(defun preamble-mode-add-menu ()
  "Add a menu entry for `preamble-mode' under Tools."
  (easy-menu-add-item nil '("Tools")
                      '("Preamble"
                        ("General"
                         ["Search in Google" prelude-google]))
                      "Search Files (Grep)...")

(defun preamble-mode-remove-menu ()
  "Remove `preamble-mode' menu entry."
  (easy-menu-remove-item nil '("Tools") "Preamble")
  (easy-menu-remove-item nil '("Tools") "--"))

;; define minor mode
(define-minor-mode preamble-mode
  "Minor mode to consolidate Emacs Preamble extensions.

\\{preamble-mode-map}"
  :lighter " Pre"
  :keymap preamble-mode-map
  (if preamble-mode
      ;; on start
      (preamble-mode-add-menu)
    ;; on stop
    (preamble-mode-remove-menu)))

(provide 'preamble-mode)

