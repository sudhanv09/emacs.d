;;; wk-project.el --- Project management config -*- lexical-binding: t; -*-

(use-package perspective
  :ensure t
  :bind
  ("C-x b" . persp-switch-to-buffer*)
  ("C-x k" . persp-kill-buffer*)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  (persp-state-default-file (expand-file-name "persp-save" user-emacs-directory))
  :hook
  (kill-emacs . (lambda ()
                  (persp-state-save persp-state-default-file)))
  (emacs-startup . (lambda ()
                     (when (file-exists-p persp-state-default-file)
                       (persp-state-load persp-state-default-file))))
  :init
  (persp-mode))

(defun my/project-switch-in-persp (dir)
  "Switch to or create a perspective named after the project in DIR."
  (interactive (list (project-prompt-project-dir)))
  (let ((name (file-name-nondirectory (directory-file-name dir))))
    (persp-switch name)
    (project-find-file)))

(setq project-switch-commands #'my/project-switch-in-persp)

(provide 'wk-project)
