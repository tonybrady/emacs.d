(require 'cl)
(require 'package)
;; (add-to-list 'load-path (concat dotfiles-dir "el-get"))
;; (require 'el-get)

(setq package-user-dir (concat dotfiles-dir "packages"))
(dolist (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")))
  (add-to-list 'package-archives source t))

(setq el-get-sources
      '((:name idle-highlight :type elpa)
        (:name haml-mode :type elpa)
        (:name sass-mode :type elpa)
        (:name ruby-mode :type elpa
               :after (lambda ()
                        ;; work around possible elpa bug
                        (ignore-errors (require 'ruby-compilation))
                        (setq ruby-use-encoding-map nil)
                        (setq rinari-major-modes
                              (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
                                    'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))))
        (:name inf-ruby :type elpa)
        (:name ruby-compilation :type elpa)
        (:name ruby-electric :type elpa)
        (:name ruby-test-mode :type elpa)
        (:name rinari :type elpa)
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :load "yaml-mode.el")
        (:name magit :type elpa)
        (:name emacs-goodies-el
               :build/darwin ("echo \"(provide 'emacs-goodies-loaddefs)\" > elisp/emacs-goodies-el/emacs-goodies-loaddefs.el")
               :features ("emacs-goodies-el"
                          "quack"
                          "markdown-mode"
                          "csv-mode")
               :after (lambda ()
                        (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
                        (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
                        (add-hook 'markdown-mode-hook 'visual-line-mode)))
        (:name ssl
               :type http
               :url "http://cvs.savannah.gnu.org/viewvc/*checkout*/w3/lisp/ssl.el?revision=1.5&root=w3"
               :build/darwin ("mv ssl.el* ssl.el")
               :features "ssl")
        (:name auto-pair
               :type http
               :url "http://github.com/emacsmirror/autopair/raw/master/autopair.el"
               :features "autopair")
        (:name emacs-jabber)
        (:name ess
               :build/darwin ("make --directory=doc info")
               :info "doc/info/"
               :features "ess")
        (:name google-maps)
        (:name ssh-config)
        (:name tail)
        (:name js-comint
               :type http
               :url "http://downloads.sourceforge.net/js-comint-el/js-comint.el"
               :features "js-comint"
               :after (lambda ()
                        (setq inferior-js-program-command "/opt/local/bin/js")
                        (add-hook 'js-mode-hook
                                  (lambda ()
                                    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
                                    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
                                    (local-set-key "\C-cb" 'js-send-buffer)
                                    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
                                    (local-set-key "\C-cl" 'js-load-file-and-go)))))
        (:name mustache-mode
               :features mustache-mode
               :type git
               :url "https://github.com/mustache/emacs.git"
               :post-init (lambda ()
                            (add-to-list 'auto-mode-alist '("\\.mustache$" . mustache-mode))
                            (add-to-list 'auto-mode-alist '("\\.hs$" . mustache-mode))
                            (add-to-list 'auto-mode-alist '("\\.handlebars$" . mustache-mode))))
        (:name gist-el
               :type git
               :url "http://github.com/defunkt/gist.el.git"
               :features "gist")
        (:name coffee-mode
               :type git
               :url "git://github.com/defunkt/coffee-mode.git"
               :features "coffee-mode"
               :after (lambda ()
                        (add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
                        (add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))))
        (:name haskell-mode)
        (:name deft
               :type git
               :url "http://github.com/emacsmirror/deft.git"
               :features "deft"
               :after (lambda ()
                        (setq deft-extension "md"
                              deft-text-mode 'markdown-mode)))
        (:name grep-edit
               :type http
               :url "http://emacswiki.org/emacs/download/grep-edit.el"
               :features "grep-edit")
        (:name rainbow-mode :type elpa)
        (:name multiple-cursors
               :type elpa
               :features "multiple-cursors")
        (:name less-css-mode
               :type elpa
               :features "less-css-mode")
        (:name pretty-symbols
               :type git
               :url "https://github.com/drothlis/pretty-symbols.git"
               :features "pretty-symbols"
               :after (lambda ()
                        (setq pretty-symbol-categories '(lambda relational logical))))
        (:name rvm
               :type elpa
               :features "rvm"
               :after (lambda ()
                        (rvm-use-default)))
        ))

(el-get)
(package-initialize)


;;; ruby
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.pill$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))

(defun jon-ruby-hook ()
  (esk-run-coding-hook)
  (autopair-mode)
  (subword-mode))
(add-hook 'ruby-mode-hook 'jon-ruby-hook)

;;; javascript
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;;; matches jshint output
;; (add-to-list 'compilation-error-regexp-alist
;;              '("^\\([^:\n\" ]+\\): line \\([0-9]+\\), col \\([0-9]+\\)" 1 2 3))

(defun jon-js-hook ()
  (esk-run-coding-hook)
  (autopair-mode)
  (subword-mode)
  (define-key js-mode-map (kbd ",") 'self-insert-command)
  (local-set-key "\C-xq" 'jon-search-mdc-for-thing-at-point)
  (local-set-key "\C-xj" 'jon-search-jquery-api-for-thing-at-point)
  (local-set-key "\C-xp" 'prettify-json)
  (setq js-indent-level 2)
  (set (make-local-variable 'compile-command)
       (concat "/Users/jon/Dev/SE/scripts/hint "
               (file-name-nondirectory (buffer-file-name (current-buffer)))))
  (set (make-local-variable 'compilation-read-command) nil)
  ;; (font-lock-add-keywords
  ;;  nil
  ;;  '(("[:=] \\(function\\)"
  ;;     (0 (prog1 nil
  ;;          (compose-region (match-beginning 1) (match-end 1) ?λ))))))
  )
(add-hook 'js-mode-hook 'jon-js-hook)
(add-hook 'js-mode-hook 'pretty-symbols-mode)

(eval-after-load 'js
  '(progn
     (defun js-insert-and-indent (key)
       (interactive (list (this-command-keys)))
       (call-interactively (lookup-key (current-global-map) key)))
     (defun prettify-json ()
       (interactive)
       (let ((b (if mark-active (min (point) (mark)) (point-min)))
             (e (if mark-active (max (point) (mark)) (point-max))))
         (shell-command-on-region
          b e "python -mjson.tool" (current-buffer) t)))))

;;; haml-mode
(defun jon-haml-mode-hook ()
  "haml-mode-hook"
  (autopair-mode)
  (visual-line-mode))
(add-hook 'haml-mode-hook 'jon-haml-mode-hook)

;;; coffee-mode
(defun jon-coffee-mode-hook ()
  "coffee-mode hook"
  (set (make-local-variable 'tab-width) 2)
  (coffee-cos-mode t)
  (setq coffee-js-mode 'js-mode)
  (autopair-mode))
(add-hook 'coffee-mode-hook 'jon-coffee-mode-hook)

;;; emacs lisp
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;;; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(defun jon-php-hook ()
  (setq c-basic-offset 4)
  (esk-run-coding-hook)
  (autopair-mode)
  (subword-mode))
(add-hook 'php-mode-hook 'jon-php-hook)

;;; css, sass, less
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

(defun jon-css-hook ()
  (setq css-indent-offset 2)
  (esk-run-coding-hook)
  (autopair-mode)
  (subword-mode)
  (rainbow-mode))
(add-hook 'css-mode-hook 'jon-css-hook)

;;; shell
(defun jon-sh-hook ()
  (interactive)
  (setq sh-basic-offset 2
        sh-indentation 2)
  (subword-mode))
(add-hook 'sh-mode-hook 'jon-sh-hook)

;;; haskell
(defun jon-haskell-hook ()
    (autopair-mode))
(add-hook 'haskell-mode-hook 'jon-haskell-hook)

;;; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;;; outline-mode for todos
(add-to-list 'auto-mode-alist '("[Tt][Oo][Dd][Oo]" . outline-mode))

;;; ssh
(autoload 'ssh "ssh" "SSH" t)

;;; flyspell
(defun jon-flyspell-hook ()
  (setq ispell-program-name "aspell"
        ispell-extra-args '("--sug-mode=fast")
        ispell-list-command "list"))
(add-hook 'flyspell-mode-hook 'jon-flyspell-hook)

;;; windmove (shift-arrow to switch windows)
(require 'windmove)
(windmove-default-keybindings)

(provide 'jon-packages)
