(in-package :blag)

(defun generate ()
  (let* ((post-files (nreverse (uiop:directory-files (fouric:resource "post-contents/" :blag))))
         (posts
           (loop :for pathspec :in post-files :collect
             (bind ((basename (file-namestring pathspec))
                    (output-name (concatenate 'string "posts/" basename))
                    (post-plist (f:read-file pathspec))
                    ((:plist title content summary epoch) post-plist))
               (post title output-name content epoch)
               (list title output-name summary)))))
    (links)
    (index posts)))
