;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'wk-elpaca)

(load-theme 'mood-one t)

(setq make-backup-files nil)

(elpaca-wait)

(require 'wk-dired)
(require 'wk-meow)
(require 'wk-packages)
(require 'wk-org)
(require 'wk-defaults)
(require 'wk-ui)
(require 'wk-project)
