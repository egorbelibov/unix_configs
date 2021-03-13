;;; themes/eb-white-theme.el -*- lexical-binding: t; -*-
(require 'doom-themes)

(def-doom-theme eb-white "A light theme inspired by Solarized light"
  ;; name        default   256       16
  ((bg         '("#F3F3F3" nil       nil            ))
   (bg-alt     '("#F6F6F6" nil       nil            ))
   (base0      '("#F1F1F1" "black"   "black"        ))
   (base1      '("#EEEEEE" "#1e1e1e" "brightblack"  ))
   (base2      '("#F1F1F1" "#2e2e2e" "brightblack"  ))
   (base3      '("#DFDFDF" "#262626" "brightblack"  ))
   (base4      '("#DCDCDC" "#3f3f3f" "brightblack"  ))
   (base5      '("#D6D6D6" "#525252" "brightblack"  ))
   (base6      '("#92A2AF" "#6b6b6b" "brightblack"  ))
   (base7      '("#788484" "#979797" "brightblack"  ))
   (base8      '("#626C6C" "#dfdfdf" "white"        ))
   (fg         '("#556b72" "#2d2d2d" "white"        ))
   (fg-alt     '("#607981" "#bfbfbf" "brightwhite"  ))
   (grey       base4)
   (red        '("#dc322f" "#ff6655" "red"          ))
   (orange     '("#556b72" "#556b72" "black"        ))
   (green      '("#556b72" "#556b72" "black"        ))
   (teal       '("#556b72" "#556b72" "black"        ))
   (yellow     '("#556b72" "#556b72" "black"        ))
   (blue       '("#556b72" "#556b72" "black"        ))
   (dark-blue  '("#556b72" "#556b72" "black"        ))
   (magenta    '("#556b72" "#556b72" "black"        ))
   (violet     '("#556b72" "#556b72" "black"        ))
   (cyan       '("#556b72" "#556b72" "black"        ))
   (dark-cyan  '("#556b72" "#556b72" "black"        ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base4)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       base6)
   (doc-comments   teal)
   (constants      violet)
   (functions      magenta)
   (keywords       green)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        cyan)
   (variables      blue)
   (numbers        violet)
   (region         `(,(doom-darken (car bg-alt) 0.07)
                     ,@(doom-darken (cdr base0) 0.07)))
   (error
    red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden `(,(car bg) "black" "black"))
   (modeline-fg nil)
   (modeline-fg-alt base5)
   (modeline-bg (doom-darken (car bg) 0.10))
   (modeline-bg-l (doom-darken (car bg) 0.1))
   (modeline-bg-inactive (doom-lighten (car bg) 0.30))
   (modeline-bg-inactive-l `(,(car bg)
                             ,@(cdr bg))))

  ;; --- Extra Faces Options ------------------------
  ((company-tooltip-selection :background base0)
   (company-template-field :background "#000000")
   (elscreen-tab-other-screen-face :background "#353a42"
                                   :foreground "#1e2022")
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)
   (font-lock-comment-face :foreground comments
                           :background bg 0.05)
   (font-lock-doc-face :inherit 'font-lock-comment-face
                       :foreground doc-comments)
   (font-lock-keyword-face :weight 'bold
                           :foreground keywords)
   (font-lock-constant-face :weight 'bold
                            :foreground constants)

   ;; Doom modeline
   (doom-modeline-bar :background blue)
   (mode-line :background modeline-bg
              :foreground modeline-fg)

   ;; (doom-modeline-bar :background base6 )
   ;; (doom-modeline-info :inherit 'mode-line-emphasis)
   ;; (doom-modeline-urgent :inherit 'mode-line-emphasis)
   ;; (doom-modeline-warning :inherit 'mode-line-emphasis)
   ;; (doom-modeline-debug :inherit 'mode-line-emphasis)
   ;; (doom-modeline-buffer-minor-mode :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-project-dir :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-project-parent-dir :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-persp-name :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-buffer-file :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-buffer-modified :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-lsp-success :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   ;; (doom-modeline-buffer-project-root :inherit 'mode-line-emphasis)
   ;; (doom-modeline-evil-insert-state :foreground cyan)
   ;; (doom-modeline-evil-visual-state :foreground yellow)

   ;; Tooltip
   (tooltip :background base4
            :foreground fg)

   ;; Indent Guide
   (indent-guide-face :foreground "#DCDCDC")

   ;; --- major-mode faces -------------------

   ;; all-the-icons
   (all-the-icons-dblue :foreground blue)

   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property :foreground teal)
   (css-selector :foreground blue)

   ;; dired
   (diredfl-dir-name :weight 'semi-bold)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold
                         :foreground red)
   (markdown-url-face :foreground base6
                      :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override) :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; org-mode
   ((org-block &override) :background bg-alt)
   ((org-block-begin-line &override) :foreground comments
    :background base2)
   (org-hide :foreground hidden)
   (org-quote :background bg-alt)
   (org-drawer :foreground base8
               :weight 'semi-bold)
   (org-document-info-keyword :foreground base6)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground teal)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground blue)
   ((outline-6 &override) :foreground blue)
   ((outline-7 &override) :foreground blue)
   ((outline-8 &override) :foreground blue)))

;;; eb-white-theme.el ends here