(use-package mood-one-theme
  :ensure t
  :config
  (load-theme 'mood-one t))

(use-package mood-line
  :ensure t
  :config (mood-line-mode))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  :hook
  (prog-mode . highlight-indent-guides-mode))

(use-package dashboard
  :ensure t
  :custom
  (dashboard-items '((projects . 5)
                     (recents . 5)))
  (dashboard-projects-backend 'project-el)
  (dashboard-center-content t)
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :config
  (dashboard-setup-startup-hook))

(use-package org-modern
  :ensure t
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

(provide 'ui)
