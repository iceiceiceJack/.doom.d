;;; ~/.doom.d/+binding.el -*- lexical-binding: t; -*-


(after! evil
  (setq evil-escape-key-sequence "kj")
  (map! :i "C-f" #'right-char
        :i "C-b" #'left-char
        :i "C-n" #'evil-next-line
        :i "C-p" #'evil-previous-line
        :i "C-d" #'delete-char
        :n "C-a" #'evil-first-non-blank
        :n "C-e" #'evil-end-of-line))

(map! :leader
      (:prefix-map ("b" . "buffer")
        :desc "switch buffer" "b" #'counsel-switch-buffer
        :desc "iBuffer"       "i" #'ibuffer)
      (:prefix-map ("t" . "toggle")
        :desc "Truncate Line" "t" #'toggle-truncate-lines))
