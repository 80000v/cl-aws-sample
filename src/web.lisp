(in-package :cl-user)
(defpackage cl-aws-sample.web
  (:use :cl
        :caveman2
        :cl-aws-sample.config
        :cl-aws-sample.view
        :cl-aws-sample.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :cl-aws-sample.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"error_404.html"
                   *template-directory*))
