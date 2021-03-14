;;; config.el -*- lexical-binding: t; -*-

(setq
 user-full-name "Egor Belibov"
 user-mail-address "egor@belibov.dev")

(setq-default
 delete-by-moving-to-trash t
 line-number-mode nil
 global-display-line-numbers-mode nil
 display-line-numbers-type nil
 doom-modeline-enable-word-count nil
 editorconfig-mode 1
 evil-want-fine-undo nil ;; t -> vim-like undo
 fill-column 100
 indent-tabs-mode nil
 tab-width 4
 ispell-dictionary "en_GB"
 locate-command "mdfind"
 multi-term-program "/bin/zsh"
 lsp-ui-mode nil)

(set-default-coding-systems 'utf-8)
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq-default major-mode 'org-mode)

(setq-default bidi-paragraph-direction 'left-to-right)

(global-so-long-mode 1)

(setq
 doom-font (font-spec :family "Hack" :size 12)
 doom-big-font (font-spec :family "Hack" :size 16)
 doom-variable-pitch-font (font-spec :family "Hack" :size 16)
 doom-serif-font (font-spec :family "Times New Roman"))

;; (load-theme 'eb-dark t)
;; (load-theme 'eb-light t)
(load-theme 'eb-white t)

(setq-default
 mode-line-format
 '("%e"
   mode-line-front-space
   mode-line-mule-info
   mode-line-client
   mode-line-modified
   mode-line-remote
   mode-line-frame-identification
   mode-line-buffer-identification
   "   "
   mode-line-position
   (vc-mode vc-mode)
   "  "
   mode-line-misc-info mode-line-end-spaces))

(defadvice! doom--disable-all-the-icons-in-tty-a (&rest _)
  :override '(all-the-icons-octicon all-the-icons-material
              all-the-icons-faicon all-the-icons-fileicon
              all-the-icons-wicon all-the-icons-alltheicon)
  "")

(map! :leader
      (:prefix "b"
       :desc "Display fill-column indicator"    "f" #'display-fill-column-indicator-mode))

(map!
 :leader
 (:prefix-map ("f" . "file")
  (:prefix-map ("g" . "goto")
   :desc "Drive"        "/" (cmd! (find-file "/"))
   :desc "Desktop"      "D" (cmd! (find-file "~/Desktop"))
   :desc "Main"         "m" (cmd! (find-file "~/main"))
   :desc "Downloads"    "d" (cmd! (find-file "~/Downloads"))
   :desc "Tmp"          "t" (cmd! (find-file "/tmp"))
   :desc "Home"         "h" (cmd! (find-file "~")))))

(setq calc-angle-mode 'rad
      calc-algebraic-mode t ;; allows '2*x instead of 'x<RET>2*
      calc-symbolic-mode t) ;; keeps stuff like √2 irrational for as long as possible

(after! company
  (setq company-idle-delay nil)
  (add-hook 'evil-normal-state-entry-hook #'company-abort))

(setq-default history-length 50)
(setq-default history-delete-duplicates t)

(global-disable-mouse-mode)
;; And, for evil's individual states.
(mapc #'disable-mouse-in-keymap
      (list evil-motion-state-map
            evil-normal-state-map
            evil-visual-state-map
            evil-insert-state-map))

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(setq dumb-jump-default-project "~/main")

(after! evil (evil-escape-mode nil))

(add-hook 'dired-mode-hook 'org-download-enable)
(setq org-download-image-dir "~/main/egorbelibov/assets/roam/download")

(setq projectile-project-search-path '("~/main/"))

(setq org-roam-directory "~/main/egorbelibov/data/braindump")

(after! org-journal
  (setq org-journal-date-prefix "#+TITLE: "
        org-journal-date-format "%a %d/%m/%y (%j)"
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-dir (file-truename "~/main/egorbelibov/data/braindump/private")))

(setq org-directory "~/.org"
      org-log-done 'time
      org-export-in-background t
      org-catch-invisible-edits 'smart)

(setq lsp-lens-enable t
      lsp-modeline-code-actions-mode t
      lsp-headerline-breadcrumb-enable t)
