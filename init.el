;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(setq auto-save-list-file-prefix (concat my-data-dir "auto-save-list/saves-"))
(setq savehist-file (concat my-data-dir "history"))
(setq project-list-file (concat my-data-dir "projects"))
(setq tramp-persistency-file-name (concat my-data-dir "tramp"))


;; Transient (Magit etc.)
(setq transient-history-file  (concat my-data-dir "transient/history.el"))
(setq transient-values-file   (concat my-data-dir "transient/values.el"))
(setq transient-levels-file   (concat my-data-dir "transient/levels.el"))

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "extra/" user-emacs-directory))

(require 'wk-elpaca)

(load-theme 'gruber-darker t)

(setq make-backup-files nil)

(elpaca-wait)

(require 'wk-meow)
(require 'wk-packages)
(require 'wk-core)
(require 'wk-keybinds)
(require 'wk-completions)
(require 'wk-workspaces)
(require 'wk-langs)
