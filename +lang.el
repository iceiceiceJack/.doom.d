;;; ~/.doom.d/+lang.el -*- lexical-binding: t; -*-

;; c/c++
(after! ccls
  (setq ccls-sem-highlight-method 'font-lock
        lsp-file-watch-threshold nil)
  (ccls-use-default-rainbow-sem-highlight)
  )

;; rust
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))
