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
 evil-want-fine-undo nil ;; t - vim-like undo
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

(defun rename-file-and-buffer ()
  "Rename the current buffer and the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(setq-default bidi-paragraph-direction 'left-to-right)

(global-so-long-mode 1)

(setq
 doom-font (font-spec :family "Hack" :size 12)
 doom-big-font (font-spec :family "Hack" :size 12)
 doom-variable-pitch-font (font-spec :family "Hack" :size 12)
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
   mode-name
   mode-line-process
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

(setq eshell-aliases-file "~/.doom.d/eshell-aliases")

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

(setq elm-tags-on-save t
      elm-sort-imports-on-save t
      elm-format-on-save t)

(setq elm-mode-hook '(elm-indent-simple-mode))

(defun elm-extra/import (&optional input)
  "Prompt for an import statement (INPUT) to add to the current file."
  (interactive)
  (let ((statement (read-string "Import statement: " (concat "import " input))))
    (save-excursion
      (goto-char (point-min))
      (if (re-search-forward "^import " nil t)
          (beginning-of-line)
        (forward-line 1)
        (insert "\n"))
      (insert (concat statement "\n")))
    (elm-sort-imports)))

(defun elm-extra/import-from-file ()
  "Select an elm file interactively and add an import for the corresponding module."
  (interactive)
  (let*
      ((all-files (projectile-current-project-files))
       (elm-files (seq-filter (lambda (f) (s-ends-with-p ".elm" f)) all-files))
       (file-name (projectile-completing-read "Module to import: " elm-files)))
    (when file-name
      (let*
          ((full-file-name (expand-file-name file-name (projectile-project-root)))
           (module-name (with-current-buffer (find-file-noselect full-file-name)
                          (elm--get-module-name))))
        (elm-extra/import module-name)))))

(defun elm-extra/show-and-copy-module-name ()
  "Show and copy the current module's name in the minibuffer."
  (interactive)
  (message (kill-new (elm--get-module-name))))

(defun elm-extra/current-module-name ()
  "Get the module name of the current buffer."
  (let*
      ((raw-components
        (file-name-sans-extension (file-relative-name (buffer-file-name) (elm-test-runner--project-root))))
       (components
        (split-string raw-components "/"))
       (modules
        (remove-if (lambda (c) (string-equal c (downcase c)))
                   components)))
    (string-join modules ".")))

(defun elm-extra/elm-module-for-path ()
  "Figure out the module name for a path.  Useful in snippets!"
  (let* ((raw-components
          (replace-regexp-in-string (projectile-project-root)
                                    ""
                                    (file-name-sans-extension (buffer-file-name))))

         (components
          (split-string raw-components "/"))

         (modules
          (remove-if
           (lambda (component) (string-equal component (downcase component)))
           components))
         )
    (string-join modules ".")))

(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
(add-hook 'elm-mode-hook (lambda () (setq-local counsel-dash-docsets '("Elm"))))
(add-hook 'haskell-mode-hook (lambda () (setq-local counsel-dash-docsets '("Haskell"))))
(add-hook 'elixir-mode-hook (lambda () (setq-local counsel-dash-docsets '("Elixir"))))
(add-hook 'rust-mode-hook (lambda () (setq-local counsel-dash-docsets '("Rust"))))
(add-hook 'web-mode-hook (lambda () (setq-local counsel-dash-docsets '("JavaScript" "HTML" "CSS"))))
(add-hook 'js-mode-hook (lambda () (setq-local counsel-dash-docsets '("JavaScript" "HTML" "CSS"))))
(add-hook 'html-mode-hook (lambda () (setq-local counsel-dash-docsets '("JavaScript" "HTML" "CSS"))))
(add-hook 'css-mode-hook (lambda () (setq-local counsel-dash-docsets '("CSS"))))
(add-hook 'sql-mode-hook (lambda () (setq-local counsel-dash-docsets '("CouchDB" "PostgreSQL"))))

(map!
 :leader
 (:prefix-map ("c" . "code")
  (:prefix-map ("b" . "Counsel")
   :desc "Find" "/" 'counsel-dash
   :desc "Find (by Cursor)" "." 'counsel-dash-at-point
   :desc "Activate Doc in Buffer" "a" 'counsel-dash-activate-docset
   :desc "Deactivate Doc to Buffer" "d" 'counsel-dash-deactivate-docset)))
