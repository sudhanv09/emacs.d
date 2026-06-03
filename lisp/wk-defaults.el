;;; wk-defaults.el --- Defaults -*- lexical-binding: t; -*-

(setq ring-bell-function 'ignore)
(setq-default sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)

(setq auto-window-vscroll nil)
(global-hl-line-mode 1)
(desktop-save-mode 1)
(savehist-mode 1)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(global-auto-revert-mode 1)

(electric-pair-mode 1)

(provide 'wk-defaults)
