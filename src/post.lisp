(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun post (title path content epoch)
  "generate HTML for a post with the given TITLE (as a text string) and CONTENT (as Markdown) and tidy and write to PATH.html"
  (with-boilerplate (path title)
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                (:div :class "card helvetica marg2"
                      (:h1 (str title))
                      (:em (str (multiple-value-bind (s m h dom mon y) (decode-universal-time (f:unix-to-universal-time epoch))
                                  (declare (ignore s m h))
                                  (format nil "Posted on ~d-~2,'0d-~2,'0d" y mon dom))))
                      (:hr)
                      (str (markdown.cl:parse content)))))))
