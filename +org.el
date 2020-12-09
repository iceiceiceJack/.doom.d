;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(after! org
  (add-to-list 'org-modules 'org-habit t)
  (setq org-ellipsis " ▼ "
        org-archive-location (concat org-directory ".archive/%s::")
        )

  ;; org-roam
  (setq org-roam-dailies-capture-templates
        '(("d" "daily" plain
           #'org-roam-capture--get-point ""
           :immediate-finish t :file-name "dailies/%<%Y>/%<%B>/%<%m-%d-%a>" :head "#+title: %<%Y-%m-%d>"))
        org-roam-capture-templates
        '(("d" "default" plain
           #'org-roam-capture--get-point "%?"
           :file-name "notes/%<%Y%m%d>-${slug}" :head "#+title: ${title}\n" :unnarrowed t))
        ;; org-roam-capture-immediate-template
        ;; '(("d" "default" plain
        ;;    #'org-roam-capture--get-point "%?"
        ;;    :file-name "notes/%<%Y%m%d>-${slug}" :head "#+title: ${title}\n" :unnarrowed t :immediate-finish t))
        )

  ;; capture
  (setq org-capture-templates
        '(
          ("t" "Inbox" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %? \n:PROPERTIES:\n:CATEGORY: \n:END:\n%i\n"
           :empty-lines-after 1 :kill-buffer t)
          ("s" "Story")
          ("st" "Tech Story" entry
           (file+headline +org-capture-todo-file "Technical Story")
           "* TODO %? \n:PROPERTIES:\n:CATEGORY: 技术需求\n:END:\n%i\n"
           :empty-lines-after 1 :kill-buffer t)
          ("sp" "Product Story" entry
           (file+headline +org-capture-todo-file "Product Story")
           "* TODO %? \n:PROPERTIES:\n:CATEGORY: 产品需求\n:END:\n%i\n"
           :empty-lines-after 1 :kill-buffer t)
          ("i" "Issue" entry
           (file+headline +org-capture-todo-file "Issue")
           "* TODO %? \n:PROPERTIES:\n:CATEGORY: issue\n:END:\n%i\n"
           :empty-lines-after 1 :kill-buffer t)
          ))

  ;; agenda
  (setq org-agenda-start-day "-7d"
        org-agenda-files (directory-files-recursively org-directory "\\.org$")
        ;; org-log-done t
        org-agenda-custom-commands
        '(
          ("w" . "Work")
          ("wa" "important and urgent!!!" tags-todo "-weekly-monthly-daily-CATEGORY=\"dream\"+PRIORITY=\"A\"")
          ("wb" "just important" tags-todo "-weekly-monthly-daily-CATEGORY=\"dream\"+PRIORITY=\"B\"")
          ("wc" "nothing serious" tags-todo "-weekly-monthly-daily-CATEGORY=\"dream\"+PRIORITY=\"C\"")
          ("d" "Dreams" tags-todo "+CATEGORY=\"dream\"")
            ))

  ;; clock
  (setq org-clock-in-switch-to-state "STRT"
        org-clock-out-switch-to-state "TODO"
        org-clock-into-drawer t
        org-clock-out-remove-zero-time-clocks t)

  ;; todo keywords
  ;; (setq org-todo-keywords
  ;;       (quote ((sequence "TODO(t!)" "FIXME(f!)" "NOTE(n!)" "STRT(s)" "HOLD(h)" "WAIT(w@/!)" "|" "DONE(d!)" "KILL(k@/!)"))))

  ;; bindings
  (map! (:mode org-mode
         (:ni "C-c i s" #'+my/org-insert-src-block)))
  (map! :map org-mode-map
        :localleader
        (:prefix ("c" . "clock")
         "p" #'org-pomodoro))
)
