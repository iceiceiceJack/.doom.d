;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

;;(setq doom-font (font-spec :family "Monospace" :size 12))

(setq doom-theme 'doom-solarized-light)
;;(setq doom-font (font-spec :family "Fira Mono" :size 12))

(after! doom-themes
  (toggle-frame-maximized))

(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))
