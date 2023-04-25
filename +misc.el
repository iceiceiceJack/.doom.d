;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Jackie Zhang"
      user-mail-address "i@codumn.com"

      )

(setq package-archives '(("gnu"             . "https://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa"           . "https://mirrors.cloud.tencent.com/elpa/melpa/")
                         ("melpa-stable"    . "https://mirrors.cloud.tencent.com/elpa/melpa-stable/")
                         ("org"             . "https://mirrors.cloud.tencent.com/elpa/org/"))
      )
(when (and IS-MAC window-system)
  (setq doom-theme 'doom-solarized-light
        ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(undecorated-round . t))
  (add-hook 'window-setup-hook #'toggle-frame-maximized)
  ;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)
  )
;; (unless window-system
;;   (setq doom-theme 'doom-nord)
;;   (global-set-key [mouse-4] 'scroll-down-line)
;;   (global-set-key [mouse-5] 'scroll-up-line)
;;   )
