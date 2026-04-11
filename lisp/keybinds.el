(require 'meow)

(defun my/scroll-down-half ()
  "Scroll backward (page up) half a screen with cursor centered."
  (interactive)
  (forward-line (- (/ (window-body-height) 2)))
  (recenter))

(defun my/scroll-up-half ()
  "Scroll forward (page down) half a screen with cursor centered."
  (interactive)
  (forward-line (/ (window-body-height) 2))
  (recenter))

(defun my/meow-setup ()
  "Meow keybinds"
  (let ((global-leader-map (make-sparse-keymap)))
    (dolist (key '("c" "g" "h" "m" "x"))
      (define-key global-leader-map (kbd key) #'meow-keypad-start))
    
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev)
     ;; global leader
     `("SPC" . ,global-leader-map)))
  (meow-leader-define-key
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet)

   ;; file ops
   '("." . consult-find)
   '("/" . consult-ripgrep)
   '("f" . find-file)
   '("b" . consult-buffer)
   '("k" . kill-buffer)
   '("s" . save-buffer)

   ;; project related
   '("p" . project-find-file)
   '("P" . project-switch-project)
   '("r" . consult-recent-file)

   ;; navigation
   '("j" . avy-goto-char-timer)
   '("l" . consult-line)
   '("i" . consult-imenu)

   ;; Window/buffer management
   '("w w" . ace-window)
   '("w d" . delete-window)
   '("w s" . split-window-below)
   '("w v" . split-window-right)
   '("w o" . delete-other-windows)

   ;; Org mode
   '("o c" . org-capture)
   '("o a" . org-agenda)

   ;; Sessions
   '("S s" . easysession-switch-to)
   '("S S" . easysession-save)
   '("S d" . easysession-delete)
   '("S r" . easysession-rename)

   '("x" . execute-extended-command)
   '("g" . magit-status)
   '("h" . describe-symbol))
  
  (meow-normal-define-key
   `(,meow-local-leader-prefix . ,emacs-local-leader-prefix)
   '("1" . meow-expand-1)
   '("2" . meow-expand-2)
   '("3" . meow-expand-3)
   '("4" . meow-expand-4)
   '("5" . meow-expand-5)
   '("6" . meow-expand-6)
   '("7" . meow-expand-7)
   '("8" . meow-expand-8)
   '("9" . meow-expand-9)
   '("0" . meow-expand-0)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . keyboard-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . keyboard-quit))

  ;; Bind C-d/C-u directly on the state keymap within meow-setup
  (define-key meow-normal-state-keymap (kbd "C-d") #'my/scroll-up-half)
  (define-key meow-normal-state-keymap (kbd "C-u") #'my/scroll-down-half))

(define-key meow-insert-state-keymap
            (kbd meow-local-leader-insert-prefix)
            (meow--parse-def emacs-local-leader-prefix))

(provide 'keybinds)
