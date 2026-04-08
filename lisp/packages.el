(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package easysession
  :ensure t
  :init
  (add-hook 'emacs-startup-hook #'easysession-save-mode 103))

(use-package casual
  :ensure t
  :defer t)

(use-package nim-mode
  :ensure t
  :mode "\\.nim\\'")

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  :config
  (vertico-mode))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package recentf
  :ensure nil
  :init
  (recentf-mode))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET"   . vertico-directory-enter)
              ("DEL"   . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package marginalia
  :after vertico
  :ensure t
  :config
  (marginalia-mode))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("M-y"   . consult-yank-pop)

   ;; Searching
   ("M-s l" . consult-line)
   ("M-s g" . consult-ripgrep)
   ("M-s i" . consult-imenu)

   ;; Navigation
   ("M-g g" . consult-goto-line)
   ("M-g o" . consult-outline)))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map vertico-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package wgrep
  :ensure t
  :defer t)

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (corfu-popupinfo-delay '(0.5 . 0.2)))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  :hook
  (prog-mode . highlight-indent-guides-mode))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package avy
  :ensure t)

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package dashboard
  :ensure t
  :custom
  (dashboard-items '((projects . 5)
                     (recents . 5)
                     (bookmarks . 5)))
  (dashboard-projects-backend 'project-el)
  (dashboard-center-content t)
  :config
  (dashboard-setup-startup-hook))

(provide 'packages)
