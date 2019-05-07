;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(after! org
  (add-to-list 'org-modules 'org-habit t))

(setq org-directory "~/org-notes/")
(setq +org-capture-todo-file "gtd.org")
(setq org-bullets-bullet-list '("#"))

;; Org clock
(setq org-clock-in-switch-to-state "STARTED")
(setq org-clock-into-drawer t)
(setq org-clock-out-remove-zero-time-clocks t)

;; todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "|" "DONE(d!)")
              (sequence "STARTED(s)" "WAITING(w@/!)" "LATER(S)" "|" "CANCELLED(c@/!)"))))

;; agenda
(setq org-agenda-inhibit-startup t) ;; ~50x speedup
(setq org-agenda-span 'day)
(setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
(setq org-agenda-window-setup 'only-window)
(setq org-log-done t)

;; capture
(setq org-capture-templates
      '(
        ;; ("t" "Todo" entry
        ;;  (file+headline +org-capture-todo-file "Capture")
        ;;  "* TODO %?\n  :PROPERTIES:\n  :CATEGORY: \n  :END:\n   %i\n"
        ;;  :prepend t :kill-buffer t)
        ("d" "Dream" entry
         (file+headline +org-capture-todo-file "Dream")
         "* TODO %?\n  :PROPERTIES:\n  :CATEGORY: dream\n  :END:\n   %i\n"
         :prepend t :kill-buffer t)
        ;; ("p" "Project")
        ;; ("pq" "Qidian" entry
        ;;  (file+headline +org-capture-todo-file "Projects")
        ;;  "* TODO [#A] %? :qidian:\n  :PROPERTIES:\n  :CATEGORY: work\n  :END:\n   %i\n"
        ;;  :prepent t :kill-buffer t)
        ;; ("n" "Notes" entry
        ;;  (file+headline +org-capture-notes-file "Quick Notes")
        ;;  "* %?\n%i\n"
        ;;  :prepend t :kill-buffer t)
        ;; ("b" "Blog")
        ;; ("bm" "Misc" entry
        ;;  (file+olp org-agenda-file-blog "Blog" "Misc")
        ;;  (function iceiceice/org-hugo-new-subtree-post-capture-template))
        ;; ("bp" "Python" entry
        ;;  (file+olp org-agenda-file-blog "Blog" "Python")
        ;;  (function iceiceice/org-hugo-new-subtree-post-capture-template))
        ))
