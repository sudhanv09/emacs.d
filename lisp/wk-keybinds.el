;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key
   '("w w" . ace-window)
   '("w d" . kill-current-buffer)
   '("w s" . split-window-below)
   '("w v" . split-window-right)))

(provide 'wk-keybinds)
