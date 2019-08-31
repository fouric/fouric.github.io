(defpackage :blag
  (:use :cl :who :cl-css :metabang-bind :trivial-shell)
  (:local-nicknames (:f :fouric) (:a :alexandria) (:s :serapeum) (:fad :cl-fad))
  (:export
   #:links
   #:index
   #:post
   #:generate))
