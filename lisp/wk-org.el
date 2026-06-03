;;; wk-org.el --- Org mode configuration -*- lexical-binding: t; -*-

(use-package org
  :ensure nil)

(use-package org-modern
  :ensure t
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-mode))

(setq org-return-follows-link t)

(provide 'wk-org)
