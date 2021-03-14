;; -*- no-byte-compile: t; -*-

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*All The Fun][All The Fun:1]]
(package! spray)
;; All The Fun:1 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*All The Fun][All The Fun:2]]
(package! speed-type)
;; All The Fun:2 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:1]]
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
;; Convenient:1 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:2]]
(use-package! org-pandoc-import :after org)
;; Convenient:2 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:3]]
(package! multi-term)
;; Convenient:3 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:4]]
(package! disable-mouse)
;; Convenient:4 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:5]]
(package! command-log-mode)
;; Convenient:5 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:6]]
(package! dumb-jump)
;; Convenient:6 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:7]]
(package! indent-guide)
;; Convenient:7 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Convenient][Convenient:8]]
(package! elisp-format)
;; Convenient:8 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Language Support][Language Support:1]]
(package! svelte-mode)
;; Language Support:1 ends here

;; [[file:../../../var/folders/xp/l09f9_nx3zg1vnq87yj1rycr0000gn/T/config.org.oLJjNg::*Balderdash (Disabled) Packages][Balderdash (Disabled) Packages:1]]
(package! flycheck-popup-tip :disable t)
;; Balderdash (Disabled) Packages:1 ends here
