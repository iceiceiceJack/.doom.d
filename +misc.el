;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

;;(setq doom-font (font-spec :family "Monospace" :size 12))
;;(setq doom-font (font-spec :family "Fira Mono" :size 12))

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")

(when IS-MAC
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(fcitx-aggressive-setup)
(when IS-LINUX
  (setq fcitx-use-dbus t))
