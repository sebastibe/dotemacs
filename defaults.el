;; No splash screen, thanks
(setq inhibit-splash-screen t)

;; Files settings
;; No backup files
(setq make-backup-files nil)

;; Text file end up with a new line
;(setq require-final-newline 'query)     

;; Use the clipboard, pretty please, so that copy/paste "works"
(setq x-select-enable-clipboard t)

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; Whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Ignore bell
(setq ring-bell-function 'ignore)

;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":"
  uniquify-after-kill-buffer-p t
  uniquify-ignore-buffers-re "^\\*")

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Use ido for minibuffer completion
(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq
  ido-save-directory-list-file "~/.emacs.d/.ido.last"
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)
  ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 12             ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; Default key to switch buffer is C-x b, but that's not easy enough.
;;
;; When you do that, to kill emacs either close its frame from the window
;; manager or do M-x kill-emacs.  Don't need a nice shortcut for a once a
;; week (or day) action.
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-c") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

(require 'tramp)
(setq tramp-default-method "ssh")
;; C-x C-f /sudo:root@host[#port]:/path/to/file to log as sudo
(set-default 'tramp-default-proxies-alist
             (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; Desktops folder in .emacs.d
(setq desktop-dirname "~/.emacs.d/desktops/")
(setq desktop-path '("~/.emacs.d/desktops/"))
(unless (file-directory-p desktop-dirname)
  (make-directory desktop-dirname t))

;; Only display trailing white space
(setq whitespace-style '(face tabs empty trailing lines-tail))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

;; Sentences do not need double spaces to end
(set-default 'sentence-end-double-space nil)

;; Enable cookies in w3m
(setq w3m-use-cookies t)

(provide 'defaults)
