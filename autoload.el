;;; ~/.doom.d/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +my/org-hugo-new-subtree-post-capture-template()
  "Returns `org-capture' template string for new Hugo post."
  (let* ((date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
         (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
         (fname (org-hugo-slug title)))
    (mapconcat #'identity
               `(
                 ,(concat "* NOTE " title)
                 ":PROPERTIES:"
                 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                 ,(concat ":EXPORT_DATE: " date)
                 ":EXPORT_FILE_NAME: index"
                 ":END:"
                 "%?\n")          ;Place the cursor here finally
               "\n"))
  )

;;;###autoload
(defun +my/org-insert-src-block(src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("C++" "python" "sh" "C" "js" "sql" "lisp")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;;;###autoload
(defun +my/pomodoro-notification()
  "show notifications when pomodoro end"
  (progn (add-hook 'org-pomodoro-finished-hook '(lambda () (+my/mac-notification "Pomodoro Finished" "Have a break!" t)))
         (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (+my/mac-notification "Short Break" "Ready to Go?" t)))
         (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (+my/mac-notification "Long Break" "Ready to Go?" t)))))

;;;###autoload
(defun +my/mac-notification(title message &optional sticky)
  "Send a notification, With Mavericks and later"
  (do-applescript
   (format "display notification \"%s\" with title \"%s\" sound name \"Ping\"" message title)))
