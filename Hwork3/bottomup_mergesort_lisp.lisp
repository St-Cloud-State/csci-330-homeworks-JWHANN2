;; Bottom-Up Mergesort Implementation in Lisp with Debugging Output

;; Function to partition a list into sorted pairs
(defun pairwise-partition (lst)
  (cond ((null lst) nil)  ;; If the list is empty, return nil
        ((null (cdr lst)) (list (list (car lst))))  ;; If one element remains, wrap it in a list
        (t (cons (list (car lst) (cadr lst)) ;; Group elements into pairs
                 (pairwise-partition (cddr lst))))))

;; Function to merge two sorted lists
(defun merge-lists (lst1 lst2)
  (format t "Merging ~a and ~a~%" lst1 lst2) ;; Debugging output
  (cond
    ((null lst1) lst2)
    ((null lst2) lst1)
    ((<= (car lst1) (car lst2))
     (cons (car lst1) (merge-lists (cdr lst1) lst2)))
    (t (cons (car lst2) (merge-lists lst1 (cdr lst2))))))

;; Function to iteratively merge pairs of lists, ensuring correct handling of odd elements
(defun merge-pairs (lst)
  (if (null (cdr lst))
      lst
      (let ((merged-lists nil))
        (loop for l1 in lst by #'cddr
              for l2 = (cadr lst)
              do (push (if l2 (merge-lists l1 l2) l1) merged-lists))
        (format t "After merging pairs: ~a~%" (reverse merged-lists)) ;; Debugging output
        (merge-pairs (reverse merged-lists)))))

;; Function to perform Bottom-Up Mergesort
(defun bottom-up-mergesort (lst)
  (let ((partitions (pairwise-partition lst)))
    (format t "Initial partitioning: ~a~%" partitions) ;; Debugging output
    (car (merge-pairs partitions))))  ;; Start merging the partitions

;; Test case
(format t "~%Sorted List: ~a" (bottom-up-mergesort '(3 1 4 1 5 9 2 6 5 3 5)))
