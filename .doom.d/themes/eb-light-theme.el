;;; themes/eb-dark-theme.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;;
(defgroup eb-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom eb-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-comment-bg eb-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'eb-dark-theme
  :type 'boolean)

(defcustom eb-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'eb-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme eb-light "A light theme inspired by Solarized light"

  ;; name        default   256       16
  ((bg         '("#FDF6E3" nil       nil            ))
   (bg-alt     '("#FFFBEA" nil       nil            ))
   (base0      '("#FFFBF0" "black"   "black"        ))
   (base1      '("#FCF8ED" "#1e1e1e" "brightblack"  ))
   (base2      '("#FCF7E8" "#2e2e2e" "brightblack"  ))
   (base3      '("#F2E6CE" "#262626" "brightblack"  ))
   (base4      '("#E1DBCD" "#3f3f3f" "brightblack"  ))
   (base5      '("#D6D6D6" "#525252" "brightblack"  ))
   (base6      '("#96A7A9" "#6b6b6b" "brightblack"  ))
   (base7      '("#788484" "#979797" "brightblack"  ))
   (base8      '("#626C6C" "#dfdfdf" "white"        ))
   (fg         '("#556b72" "#2d2d2d" "white"        ))
   (fg-alt     '("#7B8787" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#dc322f" "#ff6655" "red"          ))
   (orange     '("#556b72" "#556b72" "brightred"    ))
   (green      '("#556b72" "#556b72" "green"        ))
   (teal       '("#556b72" "#556b72" "brightgreen"  ))
   (yellow     '("#556b72" "#556b72" "yellow"       ))
   (blue       '("#556b72" "#556b72" "brightblue"   ))
   (dark-blue  '("#556b72" "#556b72" "blue"         ))
   (magenta    '("#556b72" "#556b72" "magenta"      ))
   (violet     '("#556b72" "#556b72" "brightmagenta"))
   (cyan       '("#556b72" "#556b72" "brightcyan"   ))
   (dark-cyan  '("#556b72" "#556b72" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base4)
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-solarized-light-brighter-comments
                       (doom-lighten teal 0.25)
                     base6))
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
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright eb-dark-brighter-modeline)
   (-modeline-pad (when eb-dark-padded-modeline (if (integerp
                                                                 eb-dark-padded-modeline)
                                                                eb-dark-padded-modeline
                                                              4)))
   (modeline-fg     nil)
   (modeline-fg-alt base5)
   (modeline-bg (if -modeline-bright base3 `(,(doom-darken (car bg) 0.15)
                                             ,@(cdr base0))))
   (modeline-bg-l (if -modeline-bright base3 `(,(doom-darken (car bg) 0.1)
                                               ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg)
                             ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((company-tooltip-selection     :background dark-cyan)
   (elscreen-tab-other-screen-face :background "#353a42"
                                   :foreground "#1e2022")
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)
   (font-lock-comment-face :foreground comments
                           :background (if eb-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face :inherit 'font-lock-comment-face
                       :foreground doc-comments)
   (font-lock-keyword-face :weight 'bold
                           :foreground keywords)
   (font-lock-constant-face :weight 'bold
                            :foreground constants)

   ;; Centaur tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected
                                          :foreground blue)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected
                                            :foreground blue)
   ;; Doom modeline
   (doom-modeline-bar :background blue)
   (mode-line :background modeline-bg
              :foreground modeline-fg
              :box (if -modeline-pad
                       `(:line-width ,-modeline-pad
                         :color ,modeline-bg)))
   (mode-line-inactive :background modeline-bg-inactive
                       :foreground modeline-fg-alt
                       :box (if -modeline-pad
                                `(:line-width ,-modeline-pad
                                  :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   (solaire-mode-line-face :inherit 'mode-line
                           :background modeline-bg-l
                           :box (if -modeline-pad
                                    `(:line-width ,-modeline-pad
                                      :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face :inherit 'mode-line-inactive
                                    :background modeline-bg-inactive-l
                                    :box (if -modeline-pad
                                             `(:line-width ,-modeline-pad
                                               :color ,modeline-bg-inactive-l)))
   (tooltip              :background bg-alt
                         :foreground fg)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground teal)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold
                         :foreground red)
   (markdown-url-face    :foreground teal
                         :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground teal)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken teal 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken teal 0.4))

   ;; org-mode
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :foreground comments
    :background base1)
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; eb-dark-theme.el ends here
