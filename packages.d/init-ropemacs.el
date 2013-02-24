(defun setup-ropemacs ()
  "Setup the ropemacs harness"
  (message "****************************")
  (if (and (getenv "PYTHONPATH") (not (string= (getenv "PYTHONPATH") "")))
      (message "true")
    (message "false"))
  (message "****************************")

  (pymacs-load "ropemacs" "rope-")

  (setq ropemacs-guess-project t)
  (setq ropemacs-enable-autoimport t)
  
  (setq ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"))

  ;; Adding hook to automatically open a rope project if there is one
  ;; in the current or in the upper level directory
  (add-hook 'python-mode-hook
	    (lambda ()
	      (cond ((file-exists-p ".ropeproject")
		     (rope-open-project default-directory))
		    ((file-exists-p "../.ropeproject")
		     (rope-open-project (concat default-directory "..")))
		    )))
  )

;; Python or python mode?
(eval-after-load 'python
  '(progn
     ;;==================================================
     ;; Ropemacs Configuration
     ;;==================================================
     (setup-ropemacs)

     ;;==================================================
     ;; Virtualenv Commands
     ;;==================================================
     (autoload 'virtualenv-activate "virtualenv"
       "Activate a Virtual Environment specified by PATH" t)
     (autoload 'virtualenv-workon "virtualenv"
       "Activate a Virtual Environment present using virtualenvwrapper" t)
     
     
     ;; Not on all modes, please
     (add-hook 'python-mode-hook 'flymake-find-file-hook)


     ;; when we swich on the command line, switch in Emacs
     (desktop-save-mode 1)
     (defun workon-postactivate (virtualenv)
       (require 'virtualenv)
       (virtualenv-activate virtualenv)
       (desktop-change-dir virtualenv))

     
     )
  )
