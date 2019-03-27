(in-package :blag)

(defun links ()
  (with-boilerplate ( "links" "Links")
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
                                         (:p (:a :href "#sixth-link-target" "Sixth link text") ": sixth link description")))))))))
