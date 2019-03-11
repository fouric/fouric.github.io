(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun post (title path content)
  "generate HTML for a post with the given TITLE (as a text string) and CONTENT (as Markdown) and tidy and write to PATH.html"
  (with-boilerplate (path title)
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                (:div :class "card helvetica marg2"
                      (str (markdown.cl:parse content)))))))
