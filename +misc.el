;;; ~/.doom.d/+misc.el -*- lexical-binding: t; -*-
;;; contain key bindings

(setq user-full-name "Jackie Zhang"
      user-mail-address "zhangk1991@gmail.com")

;;(setq doom-font (font-spec :family "Monospace" :size 12))
;;(setq doom-font (font-spec :family "Fira Mono" :size 12))

(when (and IS-MAC window-system)
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))
(unless window-system
  (setq doom-theme 'doom-molokai)
  (xterm-mouse-mode 1)
  (map! :g [mouse-4] 'scroll-down-line
        :g [mouse-5] 'scroll-up-line))


(after! evil
  (setq evil-escape-key-sequence "kj")
  (map! :i "C-f" #'evil-forward-char
        :i "C-b" #'evil-backward-char
        :i "C-n" #'evil-next-line
        :i "C-p" #'evil-previous-line
        :n "C-a" #'evil-first-non-blank
        :n "C-e" #'evil-end-of-line))


;; brew tap codefalling/fcitx-remote-for-osx
;; brew install codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-osx-pinyin
;; instead ABC by U.S.
(if (featurep! :input chinese)
    (after! pyim
      (pyim-basedict-enable)
      (setq default-input-method "pyim"
            pyim-default-scheme 'quanpin
            pyim-page-tooltip 'popup
            pyim-page-length 10)
      (setq-default pyim-english-input-switch-functions
                    '(pyim-probe-dynamic-english
                      pyim-probe-program-mode
                      pyim-probe-org-structure-template))
      (setq-default pyim-punctuation-half-width-functions
                    '(pyim-probe-punctuation-line-beginning
                      pyim-probe-punctuation-after-punctuation))
      (map! :g "M-i" 'pyim-convert-string-at-point))
  (fcitx-aggressive-setup)
  (when IS-LINUX
    (setq fcitx-use-dbus t)))

(map! :leader
      (:prefix-map ("b" . buffer)
        :desc "iBuffer" "i" #'ibuffer))
