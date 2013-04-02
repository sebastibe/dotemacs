;; init file entry point
(require 'cl)

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Set up load path
(add-to-list 'load-path dotfiles-dir)

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

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

;; add personal recipe folder
(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

;; el-get packages
(setq
 my:el-get-packages
 '(el-get                               ; el-get is self-hosting
   package                              ; ELPA, MELPA etc.
   dash                                 ; A modern list api
   mark-multiple                        ; mark several regions at once
   escreen                              ; screen for emacs, C-\ C-h
   buffer-move                          ; move quickly bettween buffers
   multiple-cursors                     ; multiple cursors
   smooth-scrolling                     ; smooth scorlling
   fill-column-indicator                ; draw a line at 80 char
   ace-jump-mode                        ; jump around in your file
   fit-frame                            ; fit frame to text and center
   undo-tree                            ; undo-history as a tree C-x u
   goto-last-change                     ; move cursor to the last change
   revive                               ; revive saved states of emacs
   magit                                ; magic git mode
   magithub                             ; magit enhancement for github
   monky                                ; magit for hg
   jade-mode                            ; jade templates
   coffee-mode                          ; CoffeeScript
   switch-window                        ; takes over C-x o
   auto-complete                        ; complete as you type with overlays
   zencoding-mode                       ; emacs-wiki encoding
   virtualenv                           ; virtualenv for python shell
   yasnippet                            ; snippets
   pymacs                               ; pymacs (requires python packages)
   python-pep8                          ; Python pep8 checker
   ropemacs                             ; requires mercurial to be installed
   auto-complete                        ; auto completion for all
   smex                                 ; a better (ido like) M-x
   goto-last-change                     ; explicit enough
   markdown-mode                        ; markdown major mode
   asciidoc                             ; asciidoc helpers
   color-theme                          ; nice looking emacs
   color-theme-solarized                ; solarized from ethan shoonover
   color-theme-tango                    ; looks like grey dark solarized
   color-theme-sanityinc                ; like solarized with more contrast
   minimap                              ; a minimap sidebar for emacs
   js2-mode                             ; improved javascript mode
   js2-refactor                         ; javascript refactor
   scala-mode                           ; scala
   find-file-in-project                 ; .git defined project C-x o
   browse-kill-ring                     ; browse kill ring C-x C-y
   ein                                  ; ipython notebooks for emacs
   helm                                 ; completion and selection narrowing
   less-css-mode                        ; to edit less css files (lesscss.org)
   yaml-mode                            ; major mode to edit YAML file
   projectile                           ; project management integration
   slime                                ; Superior Lisp Interaction Mode
   w3m                                  ; unix text based HTML browser
   htmlr                                ; HTML renderer
;;   swank-js                             ; interaction between js and emacs
;;   gh                                   ; github API
;;  gist                                  ; github gists
   ))

(el-get 'sync my:el-get-packages)

;; key bindings settings
(require 'key-bindings)

;; selected default color theme
(color-theme-sanityinc-dark)

(add-hook 'after-init-hook
          #'(lambda ()
              (when (locate-library "slime-js")
                (require 'setup-slime-js))))

;;; init.el ends here
