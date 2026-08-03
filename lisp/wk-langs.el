;;; wk-langs.el --- Language config -*- lexical-binding: t; -*-
(setq treesit-language-source-alist
      '((c3 "https://github.com/c3lang/tree-sitter-c3")))

(add-to-list 'treesit-extra-load-path "~/.local/share/emacs/tree-sitter/")
(require 'c3-ts-mode)
(add-to-list 'auto-mode-alist '("\\.c3\\'" . c3-ts-mode))
(add-to-list 'auto-mode-alist '("\\.c3i\\'" . c3-ts-mode))

(with-eval-after-load 'apheleia
  (add-to-list 'apheleia-formatters
			   '(c3fmt "/home/sudhanv/opt/c3/c3fmt" "--stdin" "--stdout" "--stdin-filepath" filepath))
  (add-to-list 'apheleia-mode-alist '(c3-ts-mode . c3fmt)))

(provide 'wk-langs)
