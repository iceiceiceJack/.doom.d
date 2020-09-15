;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

(setq user-full-name "Jackie Zhang"
      user-mail-address "i@codumn.com"

      ;; doom-font (font-spec :family "Iosevka SS08")

      ;; Line numbers are pretty slow all around. The performance boost of
      ;; disabling them outweighs the utility of always keeping them on.
      display-line-numbers-type nil
      )


(setq package-archives '(("gnu"             . "https://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa"           . "https://mirrors.cloud.tencent.com/elpa/melpa/")
                         ("melpa-stable"    . "https://mirrors.cloud.tencent.com/elpa/melpa-stable/")
                         ("org"             . "https://mirrors.cloud.tencent.com/elpa/org/"))
      )


(after! company
  (setq company-global-modes
        '(not erc-mode message-mode help-mode gud-mode eshell-mode org-mode markdown-mode)
        company-idle-delay 0.2
        )
  )


(after! lsp
  (setq lsp-ui-sideline-enable nil
        lsp-enable-symbol-highlighting nil
        )
  )


;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t
      )


;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; Don't need the menu; I know them all by heart
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


(when (and IS-MAC window-system)
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  ;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)
  )
(unless window-system
  (setq doom-theme 'doom-nord)
  (global-set-key [mouse-4] 'scroll-down-line)
  (global-set-key [mouse-5] 'scroll-up-line)
  )


;; brew tap codefalling/fcitx-remote-for-osx
;; brew install codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-osx-pinyin
;; instead ABC by U.S.
(fcitx-aggressive-setup)
