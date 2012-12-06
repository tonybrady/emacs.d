(when (eq system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/mysql/bin:/usr/local/git/bin:/usr/local/bin:/usr/local/texlive/2012basic/bin/universal-darwin:"
                         (getenv "PATH")
                         ":/Users/jon/bin"))
  (setenv "LANG" "en_GB.UTF-8")
  (setenv "LC_ALL" "en_GB.UTF-8")
  (setenv "LC_CTYPE" "en_GB.UTF-8")

  (setq exec-path '("/usr/local/bin"
                    "/usr/local/sbin"
                    "/usr/local/mysql/bin"
                    "/usr/bin"
                    "/bin"
                    "/usr/sbin"
                    "/sbin"
                    "/usr/X11/bin"
                    "/usr/local/git/bin"
                    "/usr/local/texlive/2012basic/bin/universal-darwin"
                    "/Users/jon/bin"))

  (defun mac-run-ruby ()
    (interactive)
    (run-ruby))
  (global-set-key (kbd "s-r") 'mac-run-ruby)

  (if (functionp 'ns-toggle-fullscreen)
      (global-set-key (kbd "<C-S-return>") 'ns-toggle-fullscreen)))

(provide 'jon-osx)
