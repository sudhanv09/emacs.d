;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key

   '("." . find-file)
   '("`" . previous-buffer)
   '("RET" . eat)
   
   '("c c" . project-compile)

   '("p f" . project-find-file)
   '("p p" . project-switch-project)
   '("p b" . persp-switch-to-buffer)
   
   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)))

(provide 'wk-keybinds)
