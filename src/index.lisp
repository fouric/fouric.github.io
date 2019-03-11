(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun index ()
  (with-boilerplate ("index" "Index")
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
                                           (:p (str (third post)))))))))))
