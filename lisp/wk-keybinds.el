;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key
   '("." . find-file)
   '("/" . consult-ripgrep)
   '("," . consult-buffer)

   '("b k" . (lambda () (interactive) (kill-buffer (current-buffer))))
   '("b l" . (lambda () (interactive) (switch-to-buffer nil)))
   '("b b" . switch-to-buffer)
   '("b n" . next-buffer)
   '("b i" . ibuffer)
   '("b S" . my/save-all-buffers)

   '("o t" . treemacs)

   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)

   ;; Workspaces (tab-bar + bufferlo)
   '("TAB TAB" . +workspace/display)
   '("TAB n" . +workspace/new)
   '("TAB d" . +workspace/delete)
   '("TAB r" . +workspace/rename)
   '("TAB s" . +workspace/switch-to)
   '("TAB p" . +workspace/switch-to-project)))

(global-set-key (kbd "C-c d") #'duplicate-dwim)

(provide 'wk-keybinds)
