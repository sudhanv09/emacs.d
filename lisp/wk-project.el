;;; wk-project.el --- Project management config -*- lexical-binding: t; -*-

(use-package perspective
  :ensure t
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  (persp-state-default-file (concat my-data-dir "persp-save"))
  :hook
  (kill-emacs . my/persp-save)
  (emacs-startup . my/persp-load)
  :init
  (persp-mode))


(defun my/persp-save ()
  (ignore-errors (persp-state-save)))

(defun my/persp-load ()
  (when (file-exists-p persp-state-default-file)
    (ignore-errors (persp-state-load persp-state-default-file))))

(defun my/project-switch-in-persp (dir)
  "Switch to or create a perspective named after the project in DIR."
  (interactive (list (project-prompt-project-dir)))
  (let* ((dir (file-truename dir))
	 (name (file-name-nondirectory
		(directory-file-name dir)))
	 (default-directory dir)
	 (project (project-current nil dir)))
    (persp-switch name)
    (project-find-file)))

(setq project-switch-commands #'my/project-switch-in-persp)

(provide 'wk-project)
