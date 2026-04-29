(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

(use-package diff-hl
  :ensure t
  :hook
  ((prog-mode . diff-hl-mode)
   (magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (diff-hl-flydiff-mode))

(provide 'vc)
