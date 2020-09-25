;;; config.el -*- lexical-binding: t; -*-

(setq
 user-full-name "Egor Belibov"
 user-mail-address "egor@belibov.dev")

(setq-default
 delete-by-moving-to-trash t
 delete-selection-mode 1
 display-line-numbers-type nil
 doom-modeline-enable-word-count nil
 editorconfig-mode 1
 evil-want-fine-undo t
 fill-column 100
 global-hl-line-mode nil
 hl-line-mode nil
 help-window-select t
 indent-tabs-mode nil
 tab-width 4)

(set-default-coding-systems 'utf-8)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(defadvice! promt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)

(setq-default major-mode 'org-mode)

(setq
 doom-font (font-spec :family "Hack" :size 12)
 doom-big-font (font-spec :family "Hack" :size 16)
 doom-variable-pitch-font (font-spec :family "Hack" :size 16)
 doom-serif-font (font-spec :family "Times New Roman"))

(load-theme 'eb-dark t)

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)



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

(setq-default history-length 1000)
(setq-default history-delete-duplicates t)

(setq spell-fu-directory "~/.doom.d/spell-fu")

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
