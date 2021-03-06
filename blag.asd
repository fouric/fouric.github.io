;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:blag-asd
  (:use :cl :asdf))

(in-package :blag-asd)

(defsystem blag
  :name "blag"
  :version "0.0.0"
  :maintainer "fouric"
  :author "fouric"
  :license "All rights reserved"
  :description "CL system for generating blag"

  :serial t
  :depends-on (:cl-who :fouric :trivial-shell :alexandria :markdown.cl :metabang-bind :serapeum :cl-fad :cl-css)
  :pathname "src"
  :components ((:file "package")
               (:file "common")
               (:file "links")
               (:file "index")
               (:file "post")
               (:file "postprocess")
               (:file "about")
               (:file "generate")))
