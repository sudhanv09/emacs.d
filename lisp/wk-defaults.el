;;; wk-defaults.el --- Defaults -*- lexical-binding: t; -*-

(setq ring-bell-function 'ignore)
(setq-default sentence-end-double-space nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-dialog-box nil)
(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq save-interprogram-paste-before-kill t)

(global-set-key (kbd "C-c x") #'kill-region)
(global-set-key (kbd "C-c c") #'kill-ring-save)
(global-set-key (kbd "C-c v") #'yank)

(setq auto-window-vscroll nil)
(desktop-save-mode 1)
(savehist-mode 1)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(global-auto-revert-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(electric-pair-mode 1)

(provide 'wk-defaults)
