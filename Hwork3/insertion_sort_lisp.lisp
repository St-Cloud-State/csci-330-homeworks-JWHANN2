;; Insertion Sort Implementation in Lisp with Detailed Debugging Output

;; Function to insert an element into a sorted list
(defun insert (elem sorted)
  (format t "Inserting ~a into ~a~%" elem sorted) ;; Debugging output
  (if (or (null sorted) (<= elem (car sorted)))
      (cons elem sorted)
      (cons (car sorted) (insert elem (cdr sorted)))))

;; Recursive function to move elements from unsorted to sorted
(defun insertion-sort-helper (sorted unsorted)
  (if (null unsorted)
      (progn
        (format t "Final sorted list: ~a~%" sorted)
        sorted)
      (let ((new-sorted (insert (car unsorted) sorted)))
        (format t "Step: Moving ~a, Sorted so far: ~a~%" (car unsorted) new-sorted) ;; Step-by-step output
        (insertion-sort-helper new-sorted (cdr unsorted)))))

;; Main function to call insertion sort
(defun insertion-sort (lst)
  (format t "Starting Insertion Sort on: ~a~%" lst) ;; Debugging output
  (insertion-sort-helper nil lst))

;; Test case
(format t "~%Final Sorted List: ~a" (insertion-sort '(3 1 4 1 5 9 2 6 5 3 5)))
