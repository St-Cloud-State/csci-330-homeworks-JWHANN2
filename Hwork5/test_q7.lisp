(load "LISPRecursiveParser.lisp")

(in-package :recursive-descent-parser)  ;; Ensure tests run in the correct package

(defun run-q7-tests ()
  (format t "Running Q7 Parser Tests...~%")

  ;; Define valid test cases (using quoted symbols for proper parsing)
  (let ((valid-tests '((a [ b c ])
                       (x [ y z w ])
                       (m [ n o p q ])
                       (i [ j k l ])
                       (e [ f g ])
                       (u [ v w x y ])
                       (o [ p q r s t ])))
        (invalid-tests '((a [ b c)
                         ([ y z w ])
                         (m n o p q ])
                         (i [ j k 5 ])
                         (e [ f g)
                         (u v w x y ])
                         (o p q r s t))))

    ;; Run valid test cases
    (dolist (test valid-tests)
      (format t "Testing valid input: ~a~%" test)
      (handler-case
          (print (parse-variable test))
        (error (e) (format t "Error: ~a~%" e))))

    ;; Run invalid test cases
    (dolist (test invalid-tests)
      (format t "Testing invalid input (should fail): ~a~%" test)
      (handler-case
          (print (parse-variable test))
        (error (e) (format t "Expected error: ~a~%" e)))))

  (format t "All Q7 tests completed.~%"))

(run-q7-tests)