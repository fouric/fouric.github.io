(in-package :blag)

(defun index (post-summaries)
  "takes a list of summaries, where each summary is a list (TITLE BASEPATH SUMMARY)"
  (with-boilerplate ("index" "Index")
    (:div :class "row justify-content-center col-md-12"
          (:div :class "card col-md-8 rounded-0 card-border"
                (loop :for post :in post-summaries
                      :for i :from 0
                      :unless (zerop i) :do (htm (:hr)) ;; intersperse the post blocks with hard returns - the preceding :unless clause means that this doesn't get run for the first post
                        :do (destructuring-bind (title basepath summary) post
                              (htm (:a :href (concatenate 'string basepath ".html")
                                       (:div :class "card"
                                             (:h3 :class "card-title"
                                                  (:b (str title)))
                                             (:p :class "post-description"
                                                 (str summary)))))))))))
