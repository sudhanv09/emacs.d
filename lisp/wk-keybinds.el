;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key

   '("." . find-file)
   '("`" . previous-buffer)
   '("RET" . eat)

   '("b b" . consult-project-buffer)
   
   '("c c" . project-compile)

   '("p p" . persp-switch)
   '("p f" . project-find-file)
   '("p n" . my/project-switch-in-persp)
   '("p b" . persp-switch-to-buffer)
   '("p d" . persp-kill)
   
   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)))

(global-set-key (kbd "C-c d") #'duplicate-dwim)
(global-set-key (kbd "C-c t") #'treemacs)

(provide 'wk-keybinds)
