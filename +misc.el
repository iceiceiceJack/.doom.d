;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")

;; (setq doom-font (font-spec :family "Iosevka SS08"))
;; (setq doom-font (font-spec :family "Fira Code"))

(setq package-archives '(("gnu"             . "https://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa"           . "https://mirrors.cloud.tencent.com/elpa/melpa/")
                         ("melpa-stable"    . "https://mirrors.cloud.tencent.com/elpa/melpa-stable/")
                         ("org"             . "https://mirrors.cloud.tencent.com/elpa/org/")))

(when (and IS-MAC window-system)
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))
  ;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen))
(unless window-system
  (setq doom-theme 'doom-nord)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line))


;; brew tap codefalling/fcitx-remote-for-osx
;; brew install codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-osx-pinyin
;; instead ABC by U.S.
(fcitx-aggressive-setup)

(after! company
  (setq company-global-modes
        '(not erc-mode message-mode help-mode gud-mode eshell-mode org-mode markdown-mode)
        company-idle-delay 0.2)
  )
