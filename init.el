(setq-default
 user-full-name "Jonathon Ramsey"
 user-mail-address "jonathon.ramsey@gmail.com"
 mail-default-reply-to "jonathon.ramsey@gmail.com")

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "lib"))

(setq custom-file (concat dotfiles-dir "custom.el"))
(setq recentf-save-file (concat dotfiles-dir "recentf"))

(require 'jon-misc)
(require 'jon-osx)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync)
(require 'jon-packages)

;; (require 'jon-starter-kit)
;; (require 'jon-defuns)
;; (require 'jon-bindings)
;; (require 'jon-templates)
;; (require 'jon-desktop)
;; (require 'jon-startup)

;; (setq custom-theme-directory "~/.emacs.d/themes")
;; (load-theme 'tomorrow-night-modeline)
(set-cursor-color "white")
