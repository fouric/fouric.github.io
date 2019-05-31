(in-package :blag)

(defun generate ()
  ;; in /post-contents/ we have a bunch of plain text files WITHOUT extensions of any kind holding post data in s-expression, plist format
  ;; start out by getting a list of the absolute pathspecs of every file in that directory
  (let* ((post-files (nreverse (uiop:directory-files (fouric:resource "post-contents/" :blag))))
         (posts
           ;; then grab every file and make a post using it
           (loop :for pathspec :in post-files
                 :collect
                 (bind ((basename (file-namestring pathspec)) ;; take an absolute pathname (pathspec) and get a string with just the filename
                        (output-name (concatenate 'string "posts/" basename)) ;; synthesize the output pathstring relative to HTML root from the posts/ directory from the input filename...WITHOUT the .html extension
                        (post-plist (f:read-file pathspec))
                        ((:plist title content summary epoch) post-plist))
                   (post title output-name content epoch)
                   (list title output-name summary)))))
    (links)
    (index posts)))
