;;; wk-packages.el --- Package configuration -*- lexical-binding: t; -*-

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package mood-line
  :ensure t
  :config
  (mood-line-mode)
  :custom
  (mood-line-glyph-alist mood-line-glyphs-fira-code))

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

(use-package dirvish
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
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode))

(use-package indent-bars
  :ensure t
  :hook ((prog-mode conf-mode yaml-ts-mode) . indent-bars-mode))

(use-package eglot
  :ensure nil
  :hook ((c-mode python-mode js-ts-mode c3-mode). eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c c a" . eglot-code-actions)
              ("C-c c f" . eglot-format)
              ("C-c c r" . eglot-rename)))

;; Jump / search labels (avy-like)
(use-package flash
  :ensure t
  :custom
  (flash-multi-window t)
  (flash-backdrop t)
  (flash-autojump t)
  (flash-rainbow nil)
  (flash-search-folds t)
  (flash-char-jump-labels t)
  (flash-char-multi-line t)
  :config
  (require 'flash-isearch)
  (flash-isearch-mode 1))

;; Code folding
(use-package kirigami
  :ensure t)

(use-package ghostel
  :ensure t
  :bind (("C-x m" . ghostel)))

(provide 'wk-packages)
