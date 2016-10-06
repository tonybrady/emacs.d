(when window-system
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode t)
  (menu-bar-mode t)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (fringe-mode '(7 . 0)))

(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(recentf-mode 1)
(show-paren-mode 1)
(ansi-color-for-comint-mode-on)
(global-auto-revert-mode t)
(line-number-mode t)
(column-number-mode t)
(windmove-default-keybindings)
;; (global-whitespace-mode t)
(winner-mode t)

(setq-default locale-coding-system 'utf-8)
(set-language-environment "utf-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq visible-bell nil
      inhibit-startup-message nil
      inhibit-startup-screen nil
      mouse-yank-at-point t
      require-final-newline t
      ido-use-filename-at-point nil
      backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups"))))

;; Minibuffers
(setq enable-recursive-minibuffers nil
      max-mini-window-height 20   ;;  max 2 lines
      resize-mini-windows 1
      truncate-lines t)

;; Fix issue with minibuffer resizing caused by graphene setting.
;;(setq resize-mini-windows 'grow-only)

;; Tabs => Spaces (4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-default 'indicate-empty-lines t)

(add-hook 'write-file-hooks
          'delete-trailing-whitespace)
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(when (functionp 'ido-mode)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point nil
        ido-max-prospects 10
        confirm-nonexistent-file-or-buffer nil))

;; The forward naming method includes part of the file’s directory name at the beginning
;; of the buffer name; using this method, buffers visiting the files
;; /u/rms/tmp/Makefile and /usr/projects/zaphod/Makefile would be named
;; ‘tmp/Makefile’ and ‘zaphod/Makefile’
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
  (delete f hippie-expand-try-functions-list))
(add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)

(global-visual-line-mode 1)

;;; for emacsclient
(server-start)

;; org-mode
;;(require 'org-install)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (ruby . t)))

(+ 1 2 4)
(provide 'jon-misc)
