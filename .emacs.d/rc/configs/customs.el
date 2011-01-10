;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(erc-email-userid "romankrv@gmail.com")
 '(erc-log-file-coding-system (quote utf-8))
 '(erc-log-write-after-insert t)
 '(erc-modules (quote (button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring scrolltobottom services smiley sound track)))
 '(erc-nick "romankrv")
 '(erc-port 6667)
 '(erc-prompt-for-password nil)
 '(erc-server "irc.freenode.net")
 '(erc-user-full-name "Roman Kalinichenko")
 '(eshell-directory-name "~/.emacs.d/temp/.eshell/")
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "~/.emacs.d/temp/.ido.last")
 '(setq erc-hide-timestamps))

(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE" "TOPIC" "353"))
;;(when  (file-exists-p "~/.ercpass")
;;    (load "~/.ercpass"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; ELPA
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

 (setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
 ("gnu" . "http://elpa.gnu.org/packages/")))
 (package-initialize)