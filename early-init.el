;;; early-init.el --- Early Emacs initialization -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

(setq inhibit-splash-screen t)

(when (boundp 'native-comp-eln-load-path)
  (startup-redirect-eln-cache (expand-file-name "emacs/eln-cache" "~/.local/share")))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
