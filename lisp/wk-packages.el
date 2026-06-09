;;; wk-packages.el --- Package configuration -*- lexical-binding: t; -*-

(use-package compat
  :ensure t)

(use-package delsel
  :ensure nil ; no need to install it as it is built-in
  :hook (after-init . delete-selection-mode))

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

(use-package treemacs
  :ensure t)

(use-package ace-window
  :ensure t)

(use-package apheleia
  :ensure t
  :init
  (apheleia-global-mode 1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package transient
  :ensure t)

(use-package diff-hl
  :ensure t
  :hook ((after-init . global-diff-hl-mode)
         (dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

(use-package indent-bars
  :ensure t
  :hook ((prog-mode conf-mode yaml-ts-mode) . indent-bars-mode))

(use-package eglot
  :ensure nil
  :hook ((c-mode python-mode) . eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c c a" . eglot-code-actions)
              ("C-c c f" . eglot-format)
              ("C-c c r" . eglot-rename)))

(use-package eat
  :ensure t)

(use-package savehist
  :ensure nil ; it is built-in
  :hook (after-init . savehist-mode))

(provide 'wk-packages)
