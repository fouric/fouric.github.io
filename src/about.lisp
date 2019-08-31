(in-package :blag)

(defun about ()
  "generate HTML for a post with the given TITLE (as a text string) and CONTENT (as Markdown) and tidy and write to PATH.html"
  (with-boilerplate ("about" "About")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0 card-border"
                (:div :class "card helvetica marg2"
                      (:h1 (str "About"))
                      (:hr)
                      (str (markdown.cl:parse "This is the blog of fouric. Although I'm planning on tweaking and improving it indefinitely, at this particular point it's *extremely* unfinished. You might notice weird HTML, dumb design decisions, bizarre color choices, and a dearth of content. Part of this can be blamed on my [home-grown Common Lisp CMS](https://github.com/fouric/fouric.github.io/blob/master/src/generate.lisp), but part of the problem is I just haven't put in the elbow grease yet.

I have a bunch of ideas and opinions on Lisp, asynchronous circuits, user interface design, software engineering, and sociology. A blog is a convenient place to put those thoughts, especially after I've had conversations that build on the same talking points repeatedly. Additionally, my writing ability has severely degraded over the past few years, and the incentive of people liking stuff I've written should help encourage me to improve my skills again.

The theme was built with help from [Jay](https://jstackstudios.com/) and the CMS/content is all my own.")))))))
