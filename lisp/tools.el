(use-package eat
  :ensure t)

(use-package casual
  :ensure t
  :defer t)

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(provide 'tools)
