(setq desktop-save 'if-exists
      desktop-restore-eager 5)
(desktop-save-mode 1)
(setq desktop-globals-to-save
      (append '((extended-command-history . 100)
                (file-name-history        . 100)
                (grep-history             . 100)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 500)
                tags-file-name
                register-alist)))

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

(provide 'jon-desktop)
