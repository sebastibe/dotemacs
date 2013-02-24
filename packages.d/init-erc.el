(load "~/.emacs.d/irc-passwords.el")

(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#django" "#python")
	("anpanman.epso.ftrd.jp" "#tartine")))

(erc :server "anpanman.epso.ftrd.jp" :port 6667 :full-name "Seb" :password anpanman-irc-password)
