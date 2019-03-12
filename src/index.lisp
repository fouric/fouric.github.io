(in-package :blag)

(declaim (optimize (speed 0) (safety 0) (space 0) (debug 3)))

(defun index (post-summaries)
  "takes a list of summaries, where each summary is a list (TITLE BASEPATH SUMMARY)"
  (with-boilerplate ("index" "Index")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-8 rounded-0" :style (inline-css '(:border "5px solid #AC885E" :padding 1% :margin 1%))
                (loop :for post :in post-summaries
                      :for i :from 0
                      :unless (zerop i) :do (htm (:hr)) ;; intersperse the post blocks with hard returns - the preceding :unless clause means that this doesn't get run for the first post
                        :do (destructuring-bind (title basepath summary) post
                              (htm (:a :href (concatenate 'string basepath ".html")
                                       (:div :class "card"
                                             (:h3 :class "card-title"
                                                  (:b (str title)))
                                             (:p :style (inline-css '(:margin-bottom 0)) (str summary)))))))))))
