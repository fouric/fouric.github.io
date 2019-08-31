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
    (links '(("News"
             ("https://news.ycombinator.com/" "Hacker News" "Paul Graham's startup culture & webdev link aggregator")
             ("https://hackaday.com/" "Hack A Day" "more computer-engineering-y, hack-y stuff with a mix of tutorials and project breakdowns")
             ("https://lobste.rs/" "Lobsters" "higher-quality, invite-only HN clone with a few improvements and a focus on PLT")
             ("http://lambda-the-ultimate.org/" "Lambda the Ultimate" "for those wanting only PLT and nothing else")
             ("https://arstechnica.com/" "Ars Technica" "more consumer-focused tech news, although some science content and good in-depth reporting keep it a cut above mainstream"))
            ("Lisp"
             ("http://www.gigamonkeys.com/book/" "Practical Common Lisp" "one of the classic Common Lisp introductions, written for people who already know how to program but not how to Lisp"))))
    (index posts)
    (postprocess)))
