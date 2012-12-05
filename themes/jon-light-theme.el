(deftheme jon-light
  "Minor change to mode line from the original
tsdh-light-theme created by Tassilo Horn.")

(custom-theme-set-faces
 'jon-light
 '(default ((t (:background "white" :foreground "black"))))
 '(diff-added ((t (:inherit diff-changed :background "light green"))))
 '(diff-changed ((t (:background "light steel blue"))))
 '(diff-indicator-added ((t (:inherit diff-indicator-changed))))
 '(diff-indicator-changed ((t (:weight bold))))
 '(diff-indicator-removed ((t (:inherit diff-indicator-changed))))
 '(diff-removed ((t (:inherit diff-changed :background "sandy brown"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :weight bold))))
 '(header-line ((t (:inherit mode-line :inverse-video t))))
 '(hl-line ((t (:background "grey95"))))
 '(minibuffer-prompt ((t (:foreground "medium blue" :weight bold))))
 '(mode-line ((t (:box (:line-width -1 :color "black" :style released-button)
                       :family "Menlo"
                       :foreground "white"
                       :background "#666666"))))
 '(mode-line-inactive ((t (:inherit mode-line
                                    :foreground "#666666"
                                    :background "white"))))
 '(org-agenda-date ((t (:inherit org-agenda-structure))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :underline t))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :foreground "dark green"))))
 '(org-agenda-structure ((t (:foreground "Blue1" :weight bold :height 1.1 :family "DeJaVu Sans"))))
 '(org-hide ((t (:foreground "white"))))
 '(org-tag ((t (:weight bold))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :weight bold))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :weight bold))))
 '(outline-3 ((t (:inherit font-lock-keyword-face :weight bold))))
 '(outline-4 ((t (:inherit font-lock-comment-face :weight bold))))
 '(outline-5 ((t (:inherit font-lock-type-face :weight bold))))
 '(outline-6 ((t (:inherit font-lock-constant-face :weight bold))))
 '(outline-7 ((t (:inherit font-lock-builtin-face :weight bold))))
 '(outline-8 ((t (:inherit font-lock-string-face :weight bold))))
 '(region ((t (:background "lightgoldenrod1"))))
 '(show-paren-match ((t (:background "LightCyan2"))))
 '(show-paren-mismatch ((t (:background "deep pink"))))
 '(window-number-face ((t (:foreground "red" :weight bold)))))

(provide-theme 'jon-light)

;; Local Variables:
;; no-byte-compile: t
;; End:
