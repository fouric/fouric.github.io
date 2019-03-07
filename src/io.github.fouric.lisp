(in-package :io.github.fouric)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(eval-when (:compile-toplevel)
  (setf (html-mode) :html5
        *attribute-quote-char* #\"))

(defun generate ()
  (with-open-file (f (fouric:resource "index.sexp.html" :io.github.fouric)
                     :direction :output
                     :if-exists :supersede)
    (with-html-output (html-stream f :prologue t :indent t)
      (:html :lang "en"
             (:head
              (:meta :charset "utf-8")
              (:link :rel "stylesheet"
                     :href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                     :integrity "sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                     :crossorigin "anonymous")
              (:link :rel "stylesheet"
                     :href "style.css")
              (:meta :name "description" :content "fouric's blog")
              (:title "Index | Slighty Preferable to the Alternative"))

             (:body :class "backPic" :style "color:black"
                    (:div :class "d-flex p-4" :style "background-color:transparent")

                    (:div :class "row justify-content-center col-md-12"
                          (:p :class "display-4 text-center col-md-8" :style "font-family:mono; background-color:transparent;margin:0 0 3% 0"
                              (:b :class "text-white chalk"
                                  "Slightly Preferable to the Alternative")))

                    (:div :class "row justify-content-center col-md-12"
                          (:div :class "card col-md-8" :style "background-color:transparent"
                                (:div :class "links"
                                      (loop :for label/url :in '(("Index" "index.html")
                                                                 ("About" "#1")
                                                                 ("Contact" "#1")
                                                                 ("Links" "links.html"))
                                            :do (htm (:a :href (second label/url) :class "toplink" (str (first label/url))))))))
                    (:style "hr{display:block;border-width:2px;border-color:grey;}")

                    (:div :class "row justify-content-center col-md-12"
                          (:div :class "card col-md-8 rounded-0" :style "border: 5px solid #AC885E; padding:1%; margin:1%;"
                                (f:intersperse '(("Fusion Reactor" "foo3" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                 ("My New Hair" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                 ("Plastic Batteries" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                 ("Language Creation" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                                 ("100th Post Celebration" "#2" "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")) post
                                                 (htm (:a :href (second post)
                                                          (:div :class "card"
                                                                (:h3 :class "card-title"
                                                                     (:b (str (first post))))
                                                                (:p (str (third post))))))
                                                 (htm (:hr))))))))))
