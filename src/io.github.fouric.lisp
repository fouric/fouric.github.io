(in-package :io.github.fouric)

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
     (:title (str (format nil "~a | Slighty Preferable to the Alternative" page-title))))))

(defun generate ()
  (with-open-file (f (fouric:resource "index.sexp.html" :io.github.fouric)
                     :direction :output
                     :if-exists :supersede)
    (with-html-output (html-stream f :prologue t :indent t)
      (:html :lang "en"
             (html-header html-stream "Index")

             (:body :class "backPic" :style (inline-css '(:color black))

                    (page-header html-stream) ;; is this supposed to be f or html-stream? does it matter?

                    (:div :class "row justify-content-center col-md-12"
                          (:div :class "card col-md-8 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                                (loop :for post :in '(("Fusion Reactor" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                      ("My New Hair" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                      ("Plastic Batteries" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                      ("Language Creation" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                      ("100th Post Celebration" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
                                      :for i :from 0
                                      :unless (zerop i) :do (htm (:hr)) ;; intersperse the post blocks with hard returns - the preceding :unless clause means that this doesn't get run for the first post
                                        :do (htm (:a :href (second post)
                                                     (:div :class "card"
                                                           (:h3 :class "card-title"
                                                                (:b (str (first post))))
                                                           (:p (str (third post))))))))))))))
