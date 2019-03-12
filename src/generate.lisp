(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun generate ()
  (let* ((post-files (nreverse (uiop:directory-files (fouric:resource "post-contents/" :blag))))
         (posts
           (loop :for pathspec :in post-files :collect
             (let* ((basename (file-namestring pathspec))
                    (output-name (concatenate 'string "posts/" basename))
                    (post-plist (f:read-file pathspec))
                    (title (getf post-plist :title))
                    (content (getf post-plist :content))
                    (summary (getf post-plist :summary))
                    (epoch (getf post-plist :epoch)))
               (post title output-name content epoch)
               (list title output-name summary)))))
    (links)
    (index posts)))
