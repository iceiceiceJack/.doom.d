;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

;;(setq doom-font (font-spec :family "Monospace" :size 12))
;;(setq doom-font (font-spec :family "Fira Mono" :size 12))

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")

(when IS-MAC
  (if window-system
    (setq doom-theme 'doom-solarized-light
          ns-use-thin-smoothing t)
    (setq doom-theme 'doom-molokai))
    (add-hook 'window-setup-hook #'toggle-frame-maximized))

;; input configure
;; (fcitx-aggressive-setup)
;; (when IS-LINUX
;;   (setq fcitx-use-dbus t))
(after! pyim
  (pyim-basedict-enable)
  (setq default-input-method "pyim"
        pyim-default-scheme 'quanpin
        pyim-page-tooltip 'popup
        pyim-page-length 9)
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation)))
