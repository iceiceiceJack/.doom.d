;;; ~/.doom.d/+lang.el -*- lexical-binding: t; -*-

;; c/c++
;; (def-package! eglot
;;   :config
;;   (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-hook 'eglot-ensure))
(after! ccls
  (setq ccls-sem-highlight-method 'font-lock)
  (add-hook 'lsp-after-open-hook #'ccls-code-lens-mode)
  (ccls-use-default-rainbow-sem-highlight))
