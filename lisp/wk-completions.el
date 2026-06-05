;;; wk-completions.el --- Completions config -*- lexical-binding:t; -*-

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
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)
   ("M-g g" . consult-goto-line)
   ("M-g i" . consult-imenu)
   ("M-g M-g" . consult-goto-line)
   ("M-s r" . consult-ripgrep)
   ("M-s l" . consult-line)))

(use-package corfu
  :ensure t
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :init
  (global-corfu-mode 1)
  (setq tab-always-indent 'complete)
  :config
  (setq corfu-auto t
	corfu-cycle t
	corfu-auto-prefix 2
	corfu-auto-delay 0.1
	corfu-preview-current nil
	corfu-min-width 20)
  (define-key corfu-map (kbd "TAB") #'corfu-complete)
  (define-key corfu-map (kbd "<tab>") #'corfu-complete)

  (corfu-history-mode t)
  (corfu-popupinfo-mode t))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-history)
  
  )

(provide 'wk-completions)
