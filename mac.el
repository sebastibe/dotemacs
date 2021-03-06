;; on mac, there's always a menu bar drown, don't have it empty
(menu-bar-mode -1)

;; change command to meta, and ignore option to use weird Norwegian keyboard
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)
(setq mac-allow-anti-aliasing t)

;; mac friendly font
(set-face-attribute 'default nil :font "Monaco-13")

;; make sure path is correct when launched as application
;; (setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:" (getenv "PATH")))
;; (push "/usr/local/bin" exec-path)
;; (push "/usr/local/share/npm/bin" exec-path)
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/share/npm/bin"))
;; (setq exec-path (append exec-path '("/usr/local/share/npm/bin")))
(setq exec-path (append exec-path '("/Users/seb/go/bin")))


;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Old fashion fullscreen for multi-displays
(setq ns-use-native-fullscreen nil)

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

(provide 'mac)
