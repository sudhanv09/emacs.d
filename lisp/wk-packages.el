;;; wk-packages.el --- Package configuration -*- lexical-binding: t; -*-

(use-package compat
  :ensure t)

(use-package delsel
  :ensure nil ; no need to install it as it is built-in
  :hook (after-init . delete-selection-mode))

(use-package vertico
  :ensure t
  :init
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word)
              ("RET" . vertico-directory-enter)))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-g M-g" . consult-goto-line)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)))

(use-package which-key
  :ensure t
  :init
  (which-key-mode 1))

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

(use-package corfu
  :ensure t
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :init
  (setq tab-always-indent 'complete)
  :config
  (global-corfu-mode 1)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package cape
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'completion-at-point-functions #'cape-elisp-symbol))))

(provide 'wk-packages)
