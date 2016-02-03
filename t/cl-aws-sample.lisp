(in-package :cl-user)
(defpackage cl-aws-sample-test
  (:use :cl
        :cl-aws-sample
        :prove))
(in-package :cl-aws-sample-test)

(plan 2)

(ok (not (find 4 '(1 2 3))))
(is 4 4)

;; blah blah blah.

(finalize)
