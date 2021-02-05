(in-package :blag)

(defun postprocess ()
  ;; want something like purgecss --css bootstrap-base.css --content index.html --content posts/2016-05-04-teaching-tip-variables-are-not-values.html --content links.html --out static
  (multiple-value-bind (output error retval)
      (shell-command
       (format nil "purgecss --css ~a --content ~a --content ~a --content ~a ~a"
               (f:resource "bootstrap-base.css" :blag)
               (f:resource "index.html" :blag)
               (f:resource "posts/2016-05-04-teaching-tip-variables-are-not-values.html " :blag)
               (f:resource "links.html" :blag)
               (f:resource "static/" :blag)))
    (if (zerop retval)
        (progn
          (shell-command (format nil "mv ~a ~a"
                                 (f:resource "static/bootstrap-base.css" :blag)
                                 (f:resource "static/bootstrap-purged.css" :blag)))
          'ok)
        (progn
          (format t "stdout: ~a~%" output)
          (format t "stderr: ~a~%" error)
          'binary-probably-doesnt-exist))))
