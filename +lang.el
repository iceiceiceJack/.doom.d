;;; ~/.doom.d/+lang.el -*- lexical-binding: t; -*-

;; c/c++
(after! ccls
  (setq ccls-sem-highlight-method 'font-lock
        lsp-file-watch-threshold nil)
  (if IS-MAC
      (ccls-use-default-rainbow-sem-highlight))
  )

;; rust
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

;; python
;; TODO unvalid
;; (setq-hook! 'python-mode-hook python-indent-offset 2)
