;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

;;(setq doom-font (font-spec :family "Monospace" :size 12))
;;(setq doom-font (font-spec :family "Fira Mono" :size 12))

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")


(when IS-MAC
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))
