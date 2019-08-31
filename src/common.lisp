(in-package :blag)
(eval-when (:compile-toplevel)
  (setf (html-mode) :html5
        *attribute-quote-char* #\"))

(defun page-header (output-path stream)
  (with-html-output (s stream :indent t)
    (:div
     (:div :class "d-flex p-4" :style (inline-css '(:background-color transparent)))

     (:div :class "row justify-content-center col-md-12"
           (:p :class "display-4 text-center col-md-8" :style (inline-css '(:font-family mono :background-color transparent :margin "0 0 3% 0"))
               (:b :class "text-white chalk"
                   "Slightly Preferable to the Alternative")))

     (:div :class "row justify-content-center col-md-12"
           (:div :class "card col-md-8" :style (inline-css '(:background-color transparent))
                 (:div :class "links"
                       (loop :for label/url :in `(("Index" "index.html")
                                                  ("About" "#1")
                                                  ("Contact" "#1")
                                                  ("Links" "links.html"))
                             :do (htm (:a :href (reference-to-relpath output-path (second label/url)) :class "toplink" (str (first label/url)))))))))))

(defun html-header (output-path stream page-title)
  (with-html-output (s stream :indent t)
    (:head
     (:meta :charset "utf-8")
     (:link :rel "stylesheet"
            :href (reference-to-relpath output-path "static/bootstrap-purged.css"))
     (:link :rel "stylesheet"
            :href (reference-to-relpath output-path "static/style.css"))
     (:meta :name "description" :content "fouric's blog")
     (:title (str (format nil "~a | Slightly Preferable to the Alternative" page-title))))))

(defun tidy (path)
  (trivial-shell:shell-command (concatenate 'string "tidy -imq -w 0 " (namestring (f:resource path :blag)))))

(defmacro with-boilerplate ((path page-title) &body body)
  (a:once-only (path page-title)
    (a:with-gensyms (f p)
      `(let ((,p (concatenate 'string ,path ".html")))
         (with-open-file (,f (f:resource ,p :blag)
                             :direction :output
                             :if-exists :supersede)
           (with-html-output (,f nil :prologue t :indent t)
             (:html :lang "en"
                    (html-header ,p ,f ,page-title)

                    (:body :class "backPic" :style (inline-css '(:color black))

                           (page-header ,p ,f) ;; is this supposed to be f or html-stream? does it matter?

                           ,@body))))
         (tidy ,p)))))

(defun reference-to-relpath (reference relpath)
  "solves a specific problem I have: how, given a reference point that's relative to a project root, and another relpath from the same root, to give the relative path from the reference to the relpath - e.g. given content/posts/foo.html and static/style.css, output ../../static/style.css"
  (let* ((number-of-ups (1- (length (remove-if (lambda (str) (zerop (length str))) (split-sequence:split-sequence #\/ reference))))) ;; "stuff/posts/foo.html" would yield 2
         (up-string (apply #'concatenate 'string (loop :for i :from 0 :to (1- number-of-ups) :collect "../"))))
    (concatenate 'string up-string relpath)))
