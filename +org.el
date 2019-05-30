;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(defvar +my-blog-dir (expand-file-name "~/Blog/"))

(after! org
  (add-to-list 'org-modules 'org-habit t)
  (add-hook 'org-mode-hook
            (lambda()
              (setq truncate-lines nil)))
  (setq org-ellipsis " ▼ "
        org-bullets-bullet-list '("#")
        org-stuck-projects '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

  ;; define file target
  (setq org-directory "~/Org-notes/"
        +org-capture-todo-file "gtd.org"
        +org-capture-notes-file "notes.org"
        +org-capture-blog-file (expand-file-name "posts.org" +my-blog-dir)
        org-agenda-files (list
                          (expand-file-name +org-capture-todo-file org-directory)
                          (expand-file-name +org-capture-notes-file org-directory)
                          +org-capture-blog-file)
        )

  ;; capture
  (setq org-capture-templates
        '(
          ("t" "Todo" entry
           (file+headline +org-capture-todo-file "Capture")
           "* TODO %?\n:PROPERTIES:\n:CATEGORY: \n:END:\n%i\n"
           :prepend t :kill-buffer t)
          ("d" "Dream" entry
           (file+headline +org-capture-todo-file "Dream")
           "* TODO %?\n:PROPERTIES:\n:CATEGORY: dream\n:END:\n%i\n"
           :prepend t :kill-buffer t)
          ("n" "Notes" entry
           (file+headline +org-capture-notes-file "Quick Notes")
           "* %?\n%i\n"
           :prepend t :kill-buffer t)
          ("w" "Work")
          ("wq" "Qidian" entry
           (file+headline +org-capture-todo-file "Work")
           "* TODO %?:qidian:\n:PROPERTIES:\n:CATEGORY: work\n:END:\n%i\n"
           :prepent t :kill-buffer t)
          ("wi" "Issue" entry
           (file+headline +org-capture-todo-file "Work")
           "* TODO %?:qidian:issue:\n:PROPERTIES:\n:CATEGORY: work\n:END:\n%i\n"
           :prepent t :kill-buffer t)
          ("b" "Blog")
          ("bm" "Misc" entry
           (file+olp +org-capture-blog-file "Blog" "Misc")
           (function +my/org-hugo-new-subtree-post-capture-template))
          ("bc" "Coding" entry
           (file+olp +org-capture-blog-file "Blog" "Coding")
           (function +my/org-hugo-new-subtree-post-capture-template))
          ))

  ;; agenda
  (setq org-agenda-inhibit-startup t ;; ~50x speedup
        ;; org-agenda-span 'day
        org-agenda-use-tag-inheritance nil ;; 3-4x speedup
        ;; org-agenda-window-setup 'only-window
        org-log-done t)
  (setq org-agenda-custom-commands
        '(
          ("b" "Blog" todo "" ((org-agenda-files '("~/Blog/posts.org"))))
          ("w" . "Task")
          ("wa" "important and urgent!!!" tags-todo "-weekly-monthly-daily+PRIORITY=\"A\"")
          ("wb" "just important" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "nothing serious" tags-todo "-weekly-monthly-daily++PRIORITY=\"C\"")
          ("p" . "Project")
          ("pq" "qidian" tags-todo "-weekly-monthly-daily+qidian+CATEGORY=\"work\"")
          ("l" "Life" tags-todo "+CATEGORY=\"life\"")
          ("d" "Dreams" tags-todo "+CATEGORY=\"dream\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "-weekly-monthly-daily+CATEGORY=\"work\"")
            ))
          ))

  ;; clock
  (setq org-clock-in-switch-to-state "STARTED"
        org-clock-out-switch-to-state "LATER"
        org-clock-into-drawer t
        org-clock-out-remove-zero-time-clocks t)

  ;; todo keywords
  (setq org-todo-keywords
        (quote ((sequence "TODO(t!)" "STARTED(s)" "LATER(l)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)"))))

  ;; bingdings
  (map! (:mode org-mode
          (:ni "C-c i s" #'+my/org-insert-src-block)))
  )
