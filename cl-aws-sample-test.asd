(in-package :cl-user)
(defpackage cl-aws-sample-test-asd
  (:use :cl :asdf))
(in-package :cl-aws-sample-test-asd)

(defsystem cl-aws-sample-test
  :author "keicy"
  :license ""
  :depends-on (:cl-aws-sample
               :prove)
  :components ((:module "t"
                :components
                ((:file "cl-aws-sample"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
