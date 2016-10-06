
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default
 user-full-name "Tony Brady"
 user-mail-address "tony@sealedenvelope.com"
 mail-default-reply-to "tony@sealedenvelope.com")

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "init"))

(setq recentf-save-file (concat dotfiles-dir "recentf"))

(require 'jon-misc)
(require 'jon-starter-kit)
(require 'jon-packages)
;;(require 'jon-defuns)
(require 'jon-bindings)
;;(require 'jon-desktop)

(setq custom-theme-directory "~/.emacs.d/themes")
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

;; powerline
(require 'powerline)
(powerline-default-theme)

;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

;; Get shell to not output crap like ^[[0G\
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Stata ado-mode
(setq load-path (cons "~/.emacs.d/ado-mode/lisp" load-path))
(require 'ado-mode)

;; JR's minor mode!
(add-to-list 'load-path "~/.emacs.d/se-emacs")
(load "se-org-mode")
