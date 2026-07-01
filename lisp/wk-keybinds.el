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


   '("o t" . treemacs)

   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)

   ;; Workspaces — live tab-bar + bufferlo
   '("TAB TAB" . +workspace/display)
   '("TAB n" . +workspace/new)
   '("TAB d" . +workspace/delete)
   '("TAB r" . +workspace/rename)
   '("TAB ." . +workspace/switch-to)
   '("TAB [" . tab-bar-switch-to-prev-tab)
   '("TAB ]" . tab-bar-switch-to-next-tab)
   '("TAB p" . +workspace/switch-to-project)

   ;; Sessions — persistent (easysession)
   '("TAB s" . easysession-save)
   '("TAB l" . easysession-switch-to)
   '("TAB R" . easysession-rename)
   '("TAB x" . easysession-delete)))

(global-set-key (kbd "C-c d") #'duplicate-dwim)

(provide 'wk-keybinds)
