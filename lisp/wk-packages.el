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
  :demand t
  :hook ((dired-mode . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  ;; Use explicit arguments so reevaluating this form never toggles modes off.
  (global-diff-hl-mode 1)
  ;; Update fringe indicators while editing, rather than only after saving.
  (diff-hl-flydiff-mode 1)

  (defun wk-diff-hl-refresh-session-buffers ()
    "Enable and refresh Diff-hl in file buffers restored by EasySession."
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (diff-hl--global-turn-on)
        (when diff-hl-mode
          (diff-hl-update)))))

  ;; EasySession restores buffers after global modes have initialized, so run
  ;; Diff-hl once more after session restoration.
  (with-eval-after-load 'easysession
    (add-hook 'easysession-after-load-hook
              #'wk-diff-hl-refresh-session-buffers)))

(use-package outline-indent
  :ensure t
  :commands outline-indent-minor-mode)

(use-package treemacs
  :ensure t
  :bind (("C-," . treemacs)
		 ("C-." . treemacs-select-window))
  :custom
  (treemacs-width 32)
  :config
  ;; Keep the sidebar limited to the project of the current buffer.
  (treemacs-project-follow-mode 1)
  ;; Make Git states distinct with the gruber-darker theme.
  (set-face-attribute 'treemacs-git-modified-face nil :foreground "#ffdd33")
  (set-face-attribute 'treemacs-git-added-face nil :foreground "#73c936")
  (set-face-attribute 'treemacs-git-untracked-face nil :foreground "#73c936")
  (set-face-attribute 'treemacs-git-renamed-face nil :foreground "#96a6c8")
  (set-face-attribute 'treemacs-git-conflict-face nil :foreground "#f43841")


  
  (set-face-attribute 'treemacs-git-ignored-face nil :foreground "#95a99f")

  ;; Keep the current file selected and update the tree when files change.
  (treemacs-git-mode 'deferred)
  (treemacs-follow-mode 1)
  (treemacs-filewatch-mode 1))

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
  :ensure t
  :init
  (kirigami-global-mode 1)

  (add-hook 'prog-mode-hook #'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook #'outline-minor-mode)
  (add-hook 'lisp-mode-hook #'outline-minor-mode)
  (add-hook 'python-mode-hook #'outline-minor-mode))

(provide 'wk-packages)
