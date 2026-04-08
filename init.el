;;; -*- lexical-binding: t; -*-

(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))
(load (expand-file-name "lisp/elpaca" user-emacs-directory))

(elpaca-wait)

(require 'ui)
(require 'defaults)
(require 'packages)
(require 'meow-config)
(require 'lsp)
(require 'uniquify)
