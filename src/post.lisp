(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun post ()
  (with-boilerplate ("post" "Post Title")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-9 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                (:div :class "card helvetica marg2"
                      (:h2 :class "card-title"
                           (:b "Post Title")
                           (:p "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")))))))
