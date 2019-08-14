;;; ~/.doom.d/+lang.el -*- lexical-binding: t; -*-

;; c/c++
(after! ccls
  (setq ccls-sem-highlight-method 'font-lock)
  (add-hook 'lsp-after-open-hook #'ccls-code-lens-mode)
  (ccls-use-default-rainbow-sem-highlight))
