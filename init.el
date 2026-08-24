;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "extra/" user-emacs-directory))

(require 'wk-elpaca)

(elpaca modus-themes
  (load-theme 'modus-vague t))

(setq make-backup-files nil)

(elpaca-wait)

(require 'wk-meow)
(require 'wk-packages)
(require 'wk-core)
(require 'wk-keybinds)
(require 'wk-completions)
(require 'wk-workspaces)
(require 'wk-langs)
