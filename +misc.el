;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


(setq user-full-name "Jackie Zhang"
      user-mail-address "i@codumn.com")

(setq package-archives '(("gnu"             . "https://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa"           . "https://mirrors.cloud.tencent.com/elpa/melpa/")
                         ("melpa-stable"    . "https://mirrors.cloud.tencent.com/elpa/melpa-stable/")
                         ("org"             . "https://mirrors.cloud.tencent.com/elpa/org/")))

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


;;; :ui doom-dashboard
;; (setq fancy-splash-image (concat doom-user-dir "splash.png"))


(use-package sis
  ;; :hook
  ;; ;; enable the /context/ and /inline region/ mode for specific buffers
  ;; (((text-mode prog-mode) . sis-context-mode)
  ;;  ((text-mode prog-mode) . sis-inline-mode))
  :config
  ;; For MacOS
  (sis-ism-lazyman-config
   ;; English input source may be: "ABC", "US" or another one.
   "com.apple.keylayout.ABC"
   ;; Other language input source: "rime", "sogou" or another one.
   "com.apple.inputmethod.SCIM.Shuangpin")
  ;; enable the /cursor color/ mode
  (sis-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (sis-global-respect-mode t)
  ;; enable the /context/ mode for all buffers
  (sis-global-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (sis-global-inline-mode t)
  )
