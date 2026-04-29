;;; -*- lexical-binding: t; -*-

(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))
(load (expand-file-name "lisp/elpaca" user-emacs-directory))

(elpaca-wait)

(require 'defaults)
(require 'completion)
(require 'editor)
(require 'tools)
(require 'vc)
(require 'langs)
(require 'ui)
(require 'meow-config)
(require 'lsp)
(require 'uniquify)
