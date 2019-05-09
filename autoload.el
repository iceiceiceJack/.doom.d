;;; ~/.doom.d/autoload.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +my/org-hugo-new-subtree-post-capture-template()
  "Returns `org-capture' template string for new Hugo post."
  (let* ((date (format-time-string (org-time-stamp-format :long :inactive) (org-current-time)))
         (title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
         (fname (org-hugo-slug title)))
    (mapconcat #'identity
               `(
                 ,(concat "* TODO " title)
                 ":PROPERTIES:"
                 ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                 ,(concat ":EXPORT_DATE: " date)
                 ":EXPORT_FILE_NAME: index"
                 ":END:"
                 "%?\n")          ;Place the cursor here finally
               "\n"))
  )
