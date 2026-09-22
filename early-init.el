;;; early-init.el --- Early Emacs initialization -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

;; Keep the checked-in configuration separate from Emacs' mutable state.
(defconst wk-emacs-data-directory
  (file-name-as-directory (expand-file-name "~/.local/share/emacs/")))
(make-directory wk-emacs-data-directory t)

(defun wk-emacs-data-file (name)
  "Return NAME inside `wk-emacs-data-directory`, creating its parent." 
  (let ((file (expand-file-name name wk-emacs-data-directory)))
    (make-directory (file-name-directory file) t)
    file))

(setq elpaca-directory (wk-emacs-data-file "elpaca/")
      native-comp-eln-load-path (list (wk-emacs-data-file "eln-cache/")))

;; Files written by built-in and commonly used packages.
(setq savehist-file (wk-emacs-data-file "history")
      easysession-directory (wk-emacs-data-file "easysession/")
      transient-history-file (wk-emacs-data-file "transient/history.el")
      
      recentf-save-file (wk-emacs-data-file "recentf")
      save-place-file (wk-emacs-data-file "places")
      bookmark-default-file (wk-emacs-data-file "bookmarks")
      project-list-file (wk-emacs-data-file "projects")

      auto-save-list-file-prefix (wk-emacs-data-file "auto-save-list/.saves-")
      custom-file (wk-emacs-data-file "custom.el")
      package-user-dir (wk-emacs-data-file "elpa/")
      treesit-grammar-source-dir (wk-emacs-data-file "tree-sitter/"))

(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

(setq inhibit-splash-screen t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
