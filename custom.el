;; Customized Emacs settings

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-load-languages
   (quote
    ((shell . t)
     (sql . t)
     (emacs-lisp . t)
     (lisp . t)
     (haskell . t))))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-roam-directory "~/org")
 '(org-roam-new-file-directory "~/org/roam"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:slant italic)))))
