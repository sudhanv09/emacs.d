(use-package which-key
  :ensure nil
  :config
  (which-key-mode))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode))

(use-package recentf
  :ensure nil
  :init
  (recentf-mode))

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode +1))

(use-package avy
  :ensure t)

(use-package undo-fu
  :ensure t)

(use-package kirigami
  :ensure t)

(provide 'editor)
