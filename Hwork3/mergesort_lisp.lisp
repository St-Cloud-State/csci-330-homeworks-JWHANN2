;; Mergesort implementation in Lisp

;; Function to partition a list into two nearly equal halves
(defun partition (lst)
  (if (or (null lst) (null (cdr lst))) ;; Base case: If the list is empty or has one element
      (values lst nil)
      (multiple-value-bind (left right) (partition (cddr lst)) ;; Recursive partitioning
        (values (cons (car lst) left) (cons (cadr lst) right)))))

;; Function to merge two sorted lists into one sorted list
(defun merge-lists (lst1 lst2)  ;; Renamed from `merge` to `merge-lists`
  (cond
    ((null lst1) lst2) ;; If lst1 is empty, return lst2
    ((null lst2) lst1) ;; If lst2 is empty, return lst1
    ((<= (car lst1) (car lst2))
     (cons (car lst1) (merge-lists (cdr lst1) lst2))) ;; Take from lst1 and recurse
    (t (cons (car lst2) (merge-lists lst1 (cdr lst2)))))) ;; Take from lst2 and recurse

;; Function to perform mergesort on a list
(defun mergesort (lst)
  (if (or (null lst) (null (cdr lst))) ;; Base case: If list has 0 or 1 element, it's already sorted
      lst
      (multiple-value-bind (left right) (partition lst) ;; Partition the list
        (merge-lists (mergesort left) (mergesort right))))) ;; Use renamed merge function

;; Test case to verify mergesort implementation
(format t "~%Sorted List: ~a" (mergesort '(3 1 4 1 5 9 2 6 5 3 5)))
