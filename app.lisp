(ql:quickload :cl-aws-sample)

(defpackage cl-aws-sample.app
  (:use :cl)
  (:import-from :lack.builder
                :builder)
  (:import-from :ppcre
                :scan
                :regex-replace)
  (:import-from :cl-aws-sample.web
                :*web*)
  (:import-from :cl-aws-sample.config
                :config
                :productionp
                :*static-directory*))
(in-package :cl-aws-sample.app)

(builder
 :session
 (:static :path (lambda (path)
          (if (ppcre:scan "^(?:/bundle.js)" path)
              path
              nil))
          :root *static-directory*)
 (if (productionp)
     nil
     :accesslog)
 (if (getf (config) :error-log)
     `(:backtrace
       :output ,(getf (config) :error-log))
     nil)
 (if (productionp)
     nil
     (lambda (app)
       (lambda (env)
         (let ((datafly:*trace-sql* t))
           (funcall app env)))))
 *web*)
