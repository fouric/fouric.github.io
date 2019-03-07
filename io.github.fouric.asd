;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:io.github.fouric-asd
  (:use :cl :asdf))

(in-package :io.github.fouric-asd)

(defsystem io.github.fouric
  :name "io.github.fouric"
  :version "0.0.0"
  :maintainer "fouric"
  :author "fouric"
  :license "All rights reserved"
  :description "CL system for generating blag"

  :serial t
  :depends-on (:cl-who :fouric :cl-css)
  :pathname "src"
  :components ((:file "package")
               (:file "io.github.fouric")))
