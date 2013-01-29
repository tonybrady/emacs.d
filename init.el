(setq-default
 user-full-name "Jonathon Ramsey"
 user-mail-address "jonathon.ramsey@gmail.com"
 mail-default-reply-to "jonathon.ramsey@gmail.com")

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
