;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")

(setq doom-font (font-spec :family "Iosevka SS08"))

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
;; (if (featurep! :input chinese)
;;     (after! pyim
;;       (pyim-basedict-enable)
;;       (setq default-input-method "pyim"
;;             pyim-default-scheme 'quanpin
;;             pyim-page-tooltip 'popup
;;             pyim-page-length 10)
;;       (setq-default pyim-english-input-switch-functions
;;                     '(pyim-probe-dynamic-english
;;                       pyim-probe-program-mode
;;                       pyim-probe-org-structure-template))
;;       (setq-default pyim-punctuation-half-width-functions
;;                     '(pyim-probe-punctuation-line-beginning
;;                       pyim-probe-punctuation-after-punctuation))
;;       (map! :g "M-i" 'pyim-convert-string-at-point))
;;   (when IS-MAC
;;     (fcitx-aggressive-setup)))


;; (def-package! ibuffer-projectile
;;   :after ibuffer
;;   :config
;;   (add-hook 'ibuffer-hook
;;     (lambda ()
;;       (ibuffer-projectile-set-filter-groups)
;;       (unless (eq ibuffer-sorting-mode 'alphabetic)
;;         (ibuffer-do-sort-by-alphabetic)))))

(after! company
  (setq company-global-modes
        '(not erc-mode message-mode help-mode gud-mode eshell-mode org-mode markdown-mode)))
