(electric-pair-mode t)
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(save-place-mode t)

(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; uniquify is required in init.el; pick a less-noisy style.
(setq uniquify-buffer-name-style 'forward)

;; Stop scattering backup~ and #lockfiles# next to source.
(setq make-backup-files nil
      create-lockfiles nil
      auto-save-default nil)

;; Don't let `customize' silently rewrite init.el.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

(provide 'defaults)
