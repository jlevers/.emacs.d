;; Customized Emacs settings

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#313131" "#D9A0A0" "#8CAC8C" "#FDECBC" "#99DDE0" "#E090C7" "#A0EDF0" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("d19f00fe59f122656f096abbc97f5ba70d489ff731d9fa9437bac2622aaa8b89" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "fb09acc5f09e521581487697c75b71414830b1b0a2405c16a9ece41b2ae64222" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "9bd5ee2b24759fbc97f86c2783d1bf8f883eb1c0dd2cf7bda2b539cd28abf6a9" "392f19e7788de27faf128a6f56325123c47205f477da227baf6a6a918f73b5dc" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "ac2ca460db1668a48c35c4d0fd842e5d2ce2d4e8567a7903b76438f2750826cd" "6973f93f55e4a6ef99aa34e10cd476bc59e2f0c192b46ec00032fe5771afd9ad" default)))
 '(fci-rule-color "#dedede")
 '(line-spacing 0.2)
 '(org-agenda-files
   (quote
    ("~/org/notes/20200524150544_small_percentages_in_a_large_world.org")))
 '(org-babel-load-languages
   (quote
    ((shell . t)
     (sql . t)
     (emacs-lisp . t)
     (lisp . t)
     (haskell . t))))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-roam-directory "~/org")
 '(org-roam-new-file-directory "~/org/notes")
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   (quote
    ((20 . "#C99090")
     (40 . "#D9A0A0")
     (60 . "#ECBC9C")
     (80 . "#DDCC9C")
     (100 . "#EDDCAC")
     (120 . "#FDECBC")
     (140 . "#6C8C6C")
     (160 . "#8CAC8C")
     (180 . "#9CBF9C")
     (200 . "#ACD2AC")
     (220 . "#BCE5BC")
     (240 . "#CCF8CC")
     (260 . "#A0EDF0")
     (280 . "#79ADB0")
     (300 . "#89C5C8")
     (320 . "#99DDE0")
     (340 . "#9CC7FB")
     (360 . "#E090C7"))))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Noto Mono"))))
 '(italic ((t (:slant italic))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit shadow\ fixed-width))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit shadow\ fixed-pitch))))
 '(org-indent ((t (:inherit org-hide\ fixed-itch))))
 '(org-link ((t (:foreground "dark orange" :underline t))))
 '(org-meta-line ((t (:inherit font-lock-comment-face\ fixed-pitch))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-verbatim ((t (:inherit shadow\ fixed-pitch))))
 '(variable-pitch ((t (:family "Baskerville")))))
