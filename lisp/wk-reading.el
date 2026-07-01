;;; wk-reading.el --- PDF and EPUB reading -*- lexical-binding: t; -*-

(use-package pdf-tools
  :ensure t
  :defer t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (setq pdf-view-display-size 'fit-page
        pdf-view-continuous t
        pdf-view-midnight-colors '("#d4c9a8" . "#1c1c1c")
        pdf-annot-activate-created-annotations t)
  (add-hook 'pdf-view-mode-hook
            (lambda ()
              (pdf-view-midnight-minor-mode 1)
              (setq-local mode-line-format nil)))
  ;; vim-style navigation
  (define-key pdf-view-mode-map (kbd "n") #'pdf-view-next-line-or-next-page)
  (define-key pdf-view-mode-map (kbd "e") #'pdf-view-previous-line-or-previous-page)
  (define-key pdf-view-mode-map (kbd "J") #'pdf-view-next-page)
  (define-key pdf-view-mode-map (kbd "K") #'pdf-view-previous-page)
  (define-key pdf-view-mode-map (kbd "g") #'pdf-view-first-page)
  (define-key pdf-view-mode-map (kbd "G") #'pdf-view-last-page)
  (define-key pdf-view-mode-map (kbd "C-d") #'pdf-view-scroll-up-or-next-page)
  (define-key pdf-view-mode-map (kbd "C-u") #'pdf-view-scroll-down-or-previous-page)
  (define-key pdf-view-mode-map (kbd "+") #'pdf-view-enlarge)
  (define-key pdf-view-mode-map (kbd "-") #'pdf-view-shrink)
  (define-key pdf-view-mode-map (kbd "=") #'pdf-view-fit-page-to-window)
  (define-key pdf-view-mode-map (kbd "f") #'pdf-view-fit-width-to-window)
  (define-key pdf-view-mode-map (kbd "m") #'pdf-view-set-slice-from-bounding-box)
  (define-key pdf-view-mode-map (kbd "M") #'pdf-view-reset-slice)
  (define-key pdf-view-mode-map (kbd "i") #'pdf-view-midnight-minor-mode)
  (define-key pdf-view-mode-map (kbd "y") #'pdf-view-kill-ring-save)
  (define-key pdf-view-mode-map (kbd "/") #'isearch-forward)
  (define-key pdf-view-mode-map (kbd "s") #'isearch-repeat-forward)
  (define-key pdf-view-mode-map (kbd "S") #'isearch-repeat-backward)
  (define-key pdf-view-mode-map (kbd "q") #'quit-window))

(use-package saveplace-pdf-view
  :ensure t
  :after pdf-tools
  :config
  (save-place-mode 1))

(use-package nov
  :ensure t
  :defer t
  :init
  (setq large-file-warning-threshold (* 50 1024 1024))
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  (setq nov-unzip-program (executable-find "unzip")))

(provide 'wk-reading)
