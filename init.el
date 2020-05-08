;; Initialize straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)


;; Installed packages
(straight-use-package 'all-the-icons)
(straight-use-package 'company)
(straight-use-package 'counsel)
(straight-use-package 'csv-mode)
(straight-use-package 'edbi)
(straight-use-package 'ein)
(straight-use-package 'haskell-mode)
(straight-use-package 'ivy)
(straight-use-package 'js2-mode)
(straight-use-package 'magit)
(straight-use-package 'markdown-mode)
(straight-use-package 'neotree)
(straight-use-package 'org)
(straight-use-package 'org-journal)
(straight-use-package 'org-pomodoro)
(straight-use-package 'projectile)
(straight-use-package 'projectile-ripgrep)
(straight-use-package 'rust-mode)
(straight-use-package 'swiper)
(straight-use-package 'undo-tree)
(straight-use-package 'use-package)
(straight-use-package 'web-mode)
(straight-use-package 'yaml-mode)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)

(straight-use-package
 '(el-patch :type git
	    :host github
	    :repo "edran/hc-zenburn-emacs"))


;; Add local load-path
(add-to-list 'load-path (concat user-emacs-directory "lisp"))


;; Put customizations in a different file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)
;; Prompt if exiting with unsaved customizations
(add-hook 'kill-emacs-query-functions
	  'custom-prompt-customize-unsaved-options)


;; Misc basic settings
(setq ring-bell-function 'ignore)  ;; Turn off bell
(global-display-line-numbers-mode)
(delete-selection-mode 1)
(electric-pair-mode 1)  ;; Autocomplete quotes, parens, etc


;; Indentation settings
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(defun my-web-mode-hook ()
  "Hooks for web-mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset-2))
(add-hook 'web-mode-hook 'my-web-mode-hook)
(defun my-python-mode-hook ()
  "Hooks for python-mode."
  (setq indent-tabs-mode nil)
  (setq python-indent 4)
  (setq tab-width 4)
  (untabify (point-min) (point-max)))
(add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-c-mode-common-hook ()
  "Customizations for c-mode, c++-mode"
  (c-set-offset 'substatement-open 0)

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;; Turn on visual-line-mode for all variants of text-mode
(add-hook 'text-mode-hook #'turn-on-visual-line-mode)


;; Keybindings for built-in commands ;; 
;; Invoke M-x without Alt key
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)


;; Autosave and back up to specific directory, preserving 5 backups
(setq backup-dir (concat user-emacs-directory "backup"))
(setq auto-save-file-name-transforms
      `((".*" ,backup-dir t)))
(setq backup-directory-alist
      `(("." . ,backup-dir))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 5)


;; Remove GUI elements
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; Command aliases
(defalias 'qrr 'query-replace-regexp)


;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)


;; Misc general functions
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME.
   From https://sites.google.com/site/steveyegge2/my-dot-emacs-file."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun move-buffer-file (dir)
  "Moves both current buffer and file it's visiting to DIR.
   From https://sites.google.com/site/steveyegge2/my-dot-emacs-file."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (new-name (concat dir "/" name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn (copy-file filename new-name 1)
             (delete-file filename)
             (set-visited-file-name new-name)
             (set-buffer-modified-p nil) t))))


;; Theme
(load-theme 'hc-zenburn t)


;; Filetype/mode associations
(setq auto-mode-alist
      (append
       '(("\\.html?\\'" . web-mode)
         ("\\.jsx?\\'" . js2-mode)
         ("\\.vue\\'" . web-mode))
       auto-mode-alist))


;; Ivy/Counsel/Swiper
(ivy-mode 1)
(counsel-mode)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")


;; magit
(global-set-key (kbd "C-x g") 'magit)


;; neotree
(global-set-key (kbd "C-c t t") 'neotree-toggle)
(setq neo-autorefresh nil)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; projectile and related packages
(projectile-mode +1)
(setq projectile-project-search-path '("~/src/hubg/" "~/src/tomtom/"))
(global-set-key (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "C-c C-f") 'projectile--find-file)
(setq projectile-completion-system 'ivy)


;; undo-tree: allow tree semantics
(global-undo-tree-mode)
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)


;; Snippets
(yas-global-mode 1)
(setq yas-snippet-dirs `(,(concat user-emacs-directory "snippets")))


;; org-mode
(setq org-basedir "~/org")
(defun org-subdir (subdir)
  (concat org-basedir subdir))
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DONE")))
(setq org-pretty-entries t)
            

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-startup-indented t)
(setq truncate-lines nil)
(setq org-log-done t)

;; org-journal
(setq org-journal-dir (org-subdir "/journal"))
(setq org-journal-file-type 'monthly)
(global-set-key (kbd "C-c j o") 'org-journal-new-entry)

;; org-roam
(use-package org-roam
  :after org
  :hook 
  (after-init . org-roam-mode)
  :straight (:host github :repo "jethrokuan/org-roam" :branch "develop")
  :custom
  (org-roam-directory org-basedir)
  (org-roam-new-file-directory (org-subdir "/notes"))
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))
(org-roam-mode 1)


(defun open-new-project-file ()
  "Used to select the filename to write to when creating a new project file with org-capture."
  (let ((fpath (read-file-name "Project file name: "
                                (org-subdir "/projects")
                                nil nil nil)))
    (find-file fpath)
    (goto-char (point-min))))


;; Day planning template from https://cpbotha.net/2019/09/21/note-taking-strategy-2019/
(setq current-journal-filename
      (concat org-journal-dir
              (format-time-string "%Y-%m.org")))

;; %i = selected text, %a org-store-link, %U created timestamp, %? place cursor here
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline current-journal-filename "Tasks")
         "* TODO %?\n:LOGBOOK:\n- Created \"TODO\" %U\n:END:\n%i\n%a\n\n" 
         :empty-lines 1)
        
        ("j" "Journal" entry (file+olp+datetree current-journal-filename)
         "* %? %T\n"
         :empty-lines 1)
        
        ("d" "Day planning" entry (file+olp+datetrpee current-journal-filename)
         "* Day planning %U

** Done list / thoughts / diary

- %?

** Tasks for today [/]
   - [ ] ...

** Experiment: Articulate your directions / systems.

** Focus blocks

** Review [/]
- [ ] [[*Vitals][month vitals]]
- [ ] org sub-projects
- [ ] calendar

** Habits / important [/]
- [ ] 7.5 hrs sleep last night
- [ ] did you write stuff down?

"
         :empty-lines 1)
        
        ("p" "Project" plain (function open-new-project-file)
         "#+TITLE: %^{Title}
#+FOR: %^{For}

%^{Description}

* Resources
- %?


* Todo
** 

* Work log / timesheet

"
         :kill-buffer nil)
        
        ("w" "Project work notes" entry (file+regexp
                                         (lambda () (buffer-file-name (current-buffer)))
                                         "Work log \/ timesheet")
         "** %t
*** Worked on / finished:
**** 
*** Timesheet

"
         :prepend t)))


(org-reload)
(put 'downcase-region 'disabled nil)


;; Custom keybindings that need to override major modes
;; From https://stackoverflow.com/a/683575/3696964
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-f") 'projectile--find-file)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode to make my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys"
  :keymap 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

;; Prevent my custom keybindings from messing with the minibuffer
(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(put 'scroll-left 'disabled nil)
