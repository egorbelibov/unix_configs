;;; lang/java/+meghanada.el -*- lexical-binding: t; -*-
;;;###if (featurep! +meghanada)

(use-package! meghanada
  :hook (java-mode-local-vars . meghanada-mode)
  :init
  (setq meghanada-server-install-dir (concat doom-etc-dir "meghanada-server/")
        meghanada-use-company (featurep! :completion company)
        meghanada-use-flycheck (featurep! :checkers syntax)
        meghanada-use-eldoc t
        meghanada-use-auto-start t)
  :config
  (set-lookup-handlers! 'java-mode
    :definition #'meghanada-jump-declaration
    :references #'meghanada-reference)

  (map! :localleader
        :map java-mode-map
        (:prefix ("r" . "refactor")
          "ia" #'meghanada-import-all
          "io" #'meghanada-optimize-import
          "l"  #'meghanada-local-variable
          "f"  #'meghanada-code-beautify)
        (:prefix ("h" . "help")
          "r"  #'meghanada-reference
          "t"  #'meghanada-typeinfo)
        (:prefix ("b" . "build")
          "f"  #'meghanada-compile-file
          "p"  #'meghanada-compile-project)))
