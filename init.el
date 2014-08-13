;; init file entry point
(require 'cl)

;; Set path to .emacs.d
(defvar preamble-dir (file-name-directory (or (buffer-file-name) load-file-name))
  "The root dir of the emacs.d config.")
(defvar preamble-core-dir (expand-file-name "core" preamble-dir)
  "The home of Preamble's core functionality.")
(defvar preamble-modules-dir (expand-file-name  "modules" preamble-dir)
  "This directory houses all of the built-in Preamble modules.")
(defvar preamble-modules-file (expand-file-name "preamble-modules.el" preamble-dir)
  "This files contains a list of modules that will be loaded by Preamble.")

;; Set up load path
(add-to-list 'load-path preamble-dir)
(add-to-list 'load-path preamble-core-dir)
(add-to-list 'load-path preamble-modules-dir)

;; defaults configuration
(require 'defaults)

;; visual settings
(require 'visual)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Misc
(require 'misc)

;; setup some mac specific config
(when is-mac (require 'mac))

;; emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))

;; el-get settings
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-user-package-directory "~/.emacs.d/packages.d/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; add personal recipe folder
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

;; update elpa recipes
(el-get-elpa-build-local-recipes)

;; el-get packages
(setq
 my:el-get-packages
 '(el-get                               ; el-get is self-hosting
   package                              ; ELPA, MELPA etc.
   dash                                 ; A modern list api
   cl-lib                               ; forward compatibility package
   escreen                              ; screen for emacs, C-\ C-h
   key-chord                            ; handle 2 keys pressed simultaneously
   fit-frame                            ; fit frame to text and center
   undo-tree                            ; undo-history as a tree C-x u
   goto-last-change                     ; move cursor to the last change
   rainbow-delimiters
   revive                               ; revive saved states of emacs
   magit                                ; magic git mode
   magit-gitflow                        ; magit with gitlfow
   monky                                ; magit for hg
   flycheck                             ; syntax checkers
   jade-mode                            ; jade templates
   zencoding-mode
   smex                                 ; a better (ido like) M-x
   asciidoc                             ; asciidoc helpers
   color-theme                          ; nice looking emacs
   color-theme-solarized                ; solarized from ethan shoonover
   color-theme-tango                    ; looks like grey dark solarized
   color-theme-sanityinc                ; like solarized with more contrast
   sublime-themes                       ; moar cool themes
   helm                                 ; completion and selection narrowing
   yaml-mode                            ; major mode to edit YAML file
   projectile                           ; project management integration
   slime                                ; Superior Lisp Interaction Mode
   htmlr                                ; HTML renderer
   multi-term                           ; shell and term in one
   shell-pop                            ; one key go to shell
   powerline                            ; Vim powerline for emacs
   calfw                                ; Calendar framework
   json-mode                            ; Beautiful json
;   mu4e
   exec-path-from-shell
   quickrun                              ; execute editing buffer
   auto-insert-choose
   pkg-info
   epl
;;   Gh                                   ; github API
;;  gist                                  ; github gists
   dash-at-point
   ))

(el-get 'sync my:el-get-packages)

;; Preamble
(require 'preamble-core)
(require 'preamble-global-keybindings)
(require 'preamble-editor)

;; key bindings settings
(require 'key-bindings)

;; the modules
(when (file-exists-p preamble-modules-file)
  (load preamble-modules-file))

;; selected default color theme
(color-theme-sanityinc-dark)

(add-hook 'after-init-hook
          #'(lambda ()
              (when (locate-library "slime-js")
                (require 'setup-slime-js))))

(guru-global-mode 1)

(setq backup-directory-alist `(("." . "~/.saves")))

;;; init.el ends here
