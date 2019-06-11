;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;; (package! ccls :disable t)
;; (package! eglot)

;; brew install hugo
(package! ox-hugo)

;; brew tap codefalling/fcitx-remote-for-osx
;; brew install codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-osx-pinyin
;; instead ABC by U.S.
(if (featurep! :input chinese)
    (package! pyim-basedict)
  (package! fcitx))

(if (featurep! :lang org)
    (package! org-pomodoro))
