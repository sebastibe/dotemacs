(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")

(require 'mu4e)
(require 'smtpmail)

(setq mu4e-drafts-folder "/Gmail/[Gmail].Drafts"
      mu4e-sent-folder   "/Gmail/[Gmail].Sent Mail"
      mu4e-trash-folder  "/Gmail/[Gmail].Trash"
      mu4e-sent-messages-behavior 'delete
      mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 60
      user-mail-address "sebastibe@gmail.com"
      user-full-name  "Sebastien Beal"
      mu4e-maildir-shortcuts
            '( ("/Gmail/INBOX"               . ?i)
               ("/Gmail/[Gmail].Sent Mail"   . ?s)
               ("/Gmail/[Gmail].Trash"       . ?t)
               ("/Gmail/[Gmail].All Mail"    . ?a))

     message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587
     message-kill-buffer-on-exit t)

(setq mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq mu4e-view-prefer-html t)
(setq mu4e-html2text-command "html2text -utf8 -width 72")
(setq mail-user-agent 'mu4e-user-agent)
