;;; wk-defaults.el --- Defaults -*- lexical-binding: t; -*-

(setq ring-bell-function 'ignore)
(setq-default sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

(setq save-interprogram-paste-before-kill t)
(setq scroll-preserve-screen-position 'always)
(setq auto-window-vscroll nil)

(savehist-mode 1)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(global-auto-revert-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(electric-pair-mode 1)

(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq-default tab-width 4)

(use-package savehist
  :ensure nil ; it is built-in
  :hook (after-init . savehist-mode))

(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))


(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

(use-package org
  :ensure nil
  :config
  (org-indent-mode t)
  (setq
   org-return-follows-link t
   org-todo-keywords
   '((sequence "TODO(t)" "DONE(d)" "HOLD(h)" "CANCELLED(c)" "IN PROGRESS(p)"))))

(use-package org-modern
  :ensure t
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-mode))

(provide 'wk-core)
