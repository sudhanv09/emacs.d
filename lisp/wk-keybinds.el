;;; wk-keybinds.el --- Custom keybinds -*- lexical-binding:t; -*-

(with-eval-after-load 'meow
  (meow-leader-define-key
   '("." . find-file)
   '("/" . consult-ripgrep)
   '("," . consult-buffer)
   '("SPC" . project-find-file)


   (cons "p" project-prefix-map)

   '("b k" . (lambda () (interactive) (kill-buffer (current-buffer))))
   '("b l" . bufferlo-switch-to-scratch-buffer)
   '("b b" . bufferlo-switch-to-buffer)
   '("b B" . bufferlo-list-buffers)
   '("b n" . next-buffer)

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

(defun wk-scroll-down () 
  (interactive)
  (scroll-up-command)
  (recenter))

(defun wk-scroll-up () 
  (interactive)
  (scroll-down-command)
  (recenter))

(global-set-key (kbd "C-c d") #'duplicate-dwim)
(global-set-key (kbd "C-v") #'wk-scroll-down)
(global-set-key (kbd "M-v") #'wk-scroll-up)

(provide 'wk-keybinds)
