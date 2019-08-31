(in-package :blag)

(defun links (link-tree)
  (with-boilerplate ("links" "Links")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0 card-border"
                (:div :class "card marg"
                      (:div :class "d-flex p-2 bg-transparent")
                      (:div
                       (:div :class "row justify-content-center col-md-12"
                             (:h1 :class "colorBlack chalk"
                                  "Link Tree"))
                       (:div :class "d-flex p-4 bg-transparent"))
                      (dolist (subcategory link-tree)
                        (let ((title (first subcategory)))
                          (htm
                           (:div :class "card col-md-9 bg-transparent colorBlack"
                                 (:h4 (str title))
                                 (:div :class "margin-left"
                                       (dolist (link (rest subcategory))
                                         (destructuring-bind (link site-name description) link
                                             (htm
                                              (:p (:a :href link (str site-name)) (str (concatenate 'string ": " description))))))))))))))))
