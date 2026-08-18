;;; modus-vague-theme.el --- Emacs port of the popular vague theme -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

;; Author: Ashish Panigrahi <public@ashishpanigrahi.com>
;; Maintainer: Ashish Panigrahi <public@ashishpanigrahi.com>
;; URL: https://github.com/paniash/modus-vague
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.2.0"))
;; Keywords: faces, theme

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;; This is the Emacs port of the popular vague theme from neovim.

;;; Code:

(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defgroup modus-vague ()
  "The vague theme ported to Emacs. A cool, dark, low contrast colorscheme.
Pastel yet vivid, like a fleeting memory..."
  :group 'faces
  :group 'modus-themes
  :link '(info-link "(modus-themes) Top")
  :prefix "modus-vague-"
  :tag "Modus Vague Theme")

(defconst modus-vague-themes
  '(modus-vague)
  "List of symbols with the Modus vague theme.")

(defvaralias 'modus-vague-collection 'modus-vague-items
  "Alias of `modus-vague-items'.")

(defconst modus-vague-items
  (append modus-vague-themes)
  "Symbols of the Modus vague theme.")

(defconst modus-vague-common-palette-mappings
  modus-themes-common-palette-mappings
  "Common palette mappings for the Modus vague theme.")

(defconst modus-vague-palette
  (modus-themes-generate-palette
   '((bg-main "#141415")
     (bg-dim "#1c1c24")
     (fg-main "#cdcdcd")

     (bg-added "#233b0f")
     (bg-added-faint "#102a00")
     (bg-added-refine "#2f512f")

     (bg-changed "#363300")
     (bg-changed-faint "#2a1f00")
     (bg-changed-refine "#4a4a00")

     (bg-removed "#4e111f")
     (bg-removed-faint "#380a0f")
     (bg-removed-refine "#751a1f")

     (fg-dim "#857f8f")
     (black "#141415")
     (shadow "#1c1c24")
     (graphite "#252530")
     (onyx "#333738")
     (muted "#606079")
     (gray "#878787")
     (white "#cdcdcd")
     (yellow "#f3be7c")
     (amber "#e8b589")
     (gold "#e0a363")
     (peach "#c48282")
     (red "#d8647e")
     (storm "#405065")
     (lilac "#c3c3d5")
     (cyan "#aeaed1")
     (magenta "#bb9dbd")
     (aqua "#b4d4cf")
     (lavender "#90a0b5")
     (teal "#9bb4bc")
     (blue "#6e94b2")
     (iris "#7e98e8")
     (green "#7fa563"))
   nil
   nil
   '((docstring amber)
     (string amber)
     (constant cyan)
     (type lilac)
     (warning yellow)
     (keyword blue)
     (variable magenta)
     (comment fg-dim)

     ;; Tab bar
     (bg-tab-bar bg-dim)
     (bg-tab-other bg-dim)

     ;; Modeline
     (bg-mode-line-inactive bg-dim)
     (border-mode-line-inactive bg-dim)
     (bg-mode-line-active bg-dim)
     (border-mode-line-active bg-dim)

     ;; Visual text
     (fg-region unspecified)

     (fringe unspecified)
     (border-mode-line-active unspecified)
     (bg-line-number-inactive unspecified)
     (bg-line-number-active unspecified)
     (fg-line-number-inactive fg-dim)
     (border-mode-line-inactive unspecified))))

(defcustom modus-vague-palette-overrides nil
  "Overrides for `modus-vague-palette'."
  :group 'modus-vague
  :package-version '(modus-vague . "0.0.1")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(modus-themes) Palette overrides"))

(defconst modus-vague-with-properties
  '((modus-vague
     modus-vague
     "The Modus vague theme."
     dark modus-themes-vivendi-palette modus-vague-palette modus-vague-palette-overrides)))

(defvar modus-vague--declared-p nil)

(defun modus-vague-declare-themes ()
  "Declare the Modus vague theme."
  (unless modus-vague--declared-p
    (dolist (theme modus-vague-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq modus-vague--declared-p t)))

(modus-vague-declare-themes)

;;;; Limit the Modus themes to only Modus vague theme

;;;###autoload
(define-minor-mode modus-vague-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Modus vague theme.
Alternatively, use the commands `modus-vague-list-colors', `modus-vague-list-colors-current'.
They are all designed to only consider the Modus vague theme."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (modus-vague-take-over-modus-themes-mode (eql t)))
  "Return list of Modus vague theme, per `MODUS-VAGUE-TAKE-OVER-MODUS-THEMES-MODE'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'modus-vague))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'dark)))
      sorted-light-dark
    modus-vague-items))

;;;; Convenience commands

;;;###autoload (autoload 'modus-vague-list-colors "modus-vague-theme")
(modus-themes-define-derivative-command modus-vague list-colors)

;;;###autoload (autoload 'modus-vague-list-colors-current "modus-vague-theme")
(modus-themes-define-derivative-command modus-vague list-colors-current)

;;;; Add themes from this package to `custom-theme-load-path'

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (add-to-list 'custom-theme-load-path dir)))

(modus-themes-theme
 'modus-vague
 'modus-vague
 "The Modus vague theme."
 'dark
 'modus-themes-vivendi-palette
 'modus-vague-palette
 'modus-vague-palette-overrides)

(provide-theme 'modus-vague)
(provide 'modus-vague)

;;; modus-vague-theme.el ends here
