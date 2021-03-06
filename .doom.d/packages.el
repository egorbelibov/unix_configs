;; -*- no-byte-compile: t; -*-

;; [[file:config.org::*All The Fun][All The Fun:1]]
(package! spray)
;; All The Fun:1 ends here

;; [[file:config.org::*All The Fun][All The Fun:2]]
(package! speed-type)
;; All The Fun:2 ends here

;; [[file:config.org::*Convenient][Convenient:1]]
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))

(use-package! org-pandoc-import :after org)
;; Convenient:1 ends here

;; [[file:config.org::*Convenient][Convenient:2]]
(package! multi-term)
;; Convenient:2 ends here

;; [[file:config.org::*Convenient][Convenient:3]]
(package! disable-mouse)
;; Convenient:3 ends here

;; [[file:config.org::*Convenient][Convenient:4]]
(package! command-log-mode)
;; Convenient:4 ends here

;; [[file:config.org::*Convenient][Convenient:5]]
(package! dumb-jump)
;; Convenient:5 ends here

;; [[file:config.org::*Convenient][Convenient:6]]
(package! indent-guide)
;; Convenient:6 ends here

;; [[file:config.org::*Convenient][Convenient:7]]
(package! elisp-format)
;; Convenient:7 ends here

;; [[file:config.org::*Convenient][Convenient:8]]
(package! engine-mode)
;; Convenient:8 ends here

;; [[file:config.org::*Convenient][Convenient:9]]
(package! nov)

(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq nov-save-place-file (concat doom-cache-dir "nov-places")))
;; Convenient:9 ends here

;; [[file:config.org::*Convenient][Convenient:10]]
(package! ivy-youtube)
;; Convenient:10 ends here

;; [[file:config.org::*Convenient][Convenient:11]]
(package! transpose-frame)
;; Convenient:11 ends here

;; [[file:config.org::*Language Support][Language Support:1]]
(package! svelte-mode)
;; Language Support:1 ends here

;; [[file:config.org::*Balderdash (Disabled) Packages][Balderdash (Disabled) Packages:1]]
(package! flycheck-popup-tip :disable t)
;; Balderdash (Disabled) Packages:1 ends here
