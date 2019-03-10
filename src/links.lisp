(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(eval-when (:compile-toplevel)
  (setf (html-mode) :html5
        *attribute-quote-char* #\"))

(defun links ()
  (with-open-file (f (fouric:resource "links.html" :blag)
                     :direction :output
                     :if-exists :supersede)
    (with-html-output (html-stream f :prologue t :indent t)
      (:html :lang "en"
             (html-header html-stream "Links")

             (:body :class "backPic" :style (inline-css '(:color black))

                    (page-header html-stream) ;; is this supposed to be f or html-stream? does it matter?

                    (:div :class "row justify-content-center col-md-12"
                          (:div :class "card col-md-9 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                                (:div :class "card marg"
                                      (:body :class "backPic textColor"
                                             (:div :class "d-flex p-2 bg-transparent")
                                             (:div
                                              (:div :class "row justify-content-center col-md-12"
                                                    (:h1 :class "colorBlack chalk"
                                                         "Link Tree"))
                                              (:div :class "d-flex p-4 bg-transparent"))
                                             (:div :class "card col-md-9 bg-transparent colorBlack"
                                                   (:h4 "Programming")
                                                   (:div :class "margin-left"
                                                         (:p (:a :href "#first-link-target" "First link text") ": first link description")
                                                         (:p (:a :href "#second-link-target" "Second link text") ": second link description")
                                                         (:p (:a :href "#third-link-target" "Third link text") ": third link description")))
                                             (:div :class "d-flex p-4 bg-transparent")
                                             (:div :class "d-flex p-4 bg-transparent")
                                             (:div :class "card col-md-9 bg-transparent colorBlack"
                                                   (:h4 "Hardware")
                                                   (:div :class "margin-left"
                                                         (:p (:a :href "#fourth-link-target" "Fourth link text") ": fourth link description")
                                                         (:p (:a :href "#fifth-link-target" "Fifth link text") ": fifthlink description")
                                                         (:p (:a :href "#sixth-link-target" "Sixth link text") ": sixth link description"))))))))))))
