;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Henry Hoff"
      user-mail-address "henry@henryhoff.org")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "monospace" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)
(setq doom-theme 'modus-vivendi)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq whitespace-style '(face empty trailing lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

(setq indent-tabs-mode 1)

(setq highlight-indent-guides-auto-even-face-perc 8)
(setq highlight-indent-guides-auto-odd-face-perc 12)
(highlight-indent-guides-auto-set-faces)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'prog-mode-hook 'highlight-indent-guides-auto-set-faces)

;;(require 'ccls)
;;(setq ccls-executable "~/.config/ccls.sh")

(require 'ox-publish)
(defun website-sync (_)
    (shell-command
        "rsync -r --delete ~/code/website/html/ html@henryhoff.org:/usr/share/nginx/html/"))
(setq org-publish-project-alist '(
    ("website"
        :base-directory "~/code/website/org"
        :base-extension "org"
        :publishing-directory "~/code/website/html"
        :recursive t
        :publishing-function org-html-publish-to-html
        :completion-function website-sync
    )
))

(defun org-sync ()
  (interactive)
  (shell-command "git commit -am $(date -I) && git push")
  (print! "~/org synced to remote"))

(map! :nv "C-a" 'evil-numbers/inc-at-pt)
(map! :nv "C-x" 'evil-numbers/dec-at-pt)
