(setq-default
 user-full-name "Tony Brady"
 user-mail-address "tony@sealedenvelope.com"
 mail-default-reply-to "tony@sealedenvelope.com")

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "lib"))

(setq recentf-save-file (concat dotfiles-dir "recentf"))

(require 'jon-misc)
(require 'jon-osx)
(require 'jon-starter-kit)
(require 'jon-packages)
(require 'jon-defuns)
(require 'jon-bindings)
(require 'jon-templates)
(require 'jon-desktop)
;; (require 'jon-startup)

(setq custom-theme-directory "~/.emacs.d/themes")
(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)
(set-cursor-color "white")
