;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key
   '("." . find-file)

   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)))

(global-set-key (kbd "C-c d") #'duplicate-dwim)
(global-set-key (kbd "C-c t") #'treemacs)

(provide 'wk-keybinds)
