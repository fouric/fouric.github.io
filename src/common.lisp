(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(eval-when (:compile-toplevel)
  (setf (html-mode) :html5
        *attribute-quote-char* #\"))

(defun page-header (stream)
  (with-html-output (s stream :indent t)
    (:div
     (:div :class "d-flex p-4" :style (inline-css '(:background-color transparent)))

     (:div :class "row justify-content-center col-md-12"
           (:p :class "display-4 text-center col-md-8" :style (inline-css '(:font-family mono :background-color transparent :margin "0 0 3% 0"))
               (:b :class "text-white chalk"
                   "Slightly Preferable to the Alternative")))

     (:div :class "row justify-content-center col-md-12"
           (:div :class "card col-md-8" :style (inline-css '(:background-color transparent))
                 (:div :class "links"
                       (loop :for label/url :in '(("Index" "index.html")
                                                  ("About" "#1")
                                                  ("Contact" "#1")
                                                  ("Links" "links.html"))
                             :do (htm (:a :href (second label/url) :class "toplink" (str (first label/url)))))))))))

(defun html-header (stream page-title)
  (with-html-output (s stream :indent t)
    (:head
     (:meta :charset "utf-8")
     (:link :rel "stylesheet"
            :href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            :integrity "sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            :crossorigin "anonymous")
     (:link :rel "stylesheet"
            :href "style.css")
     (:meta :name "description" :content "fouric's blog")
     (:title (str (format nil "~a | Slightly Preferable to the Alternative" page-title))))))
