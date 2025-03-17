(defpackage :recursive-descent-parser
  (:use :common-lisp)
  (:export :parse-variable :parse-new :parse-expression :identifierp))

(in-package :recursive-descent-parser)

(defun identifierp (sym)
  "Checks if the given symbol is a valid identifier (uppercase or lowercase)."
  (and (symbolp sym)
       (let ((name (symbol-name sym)))
         (every (lambda (c) (find c "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"))
                name))))

(defun parse-expression (input)
  "Parses an expression enclosed in brackets."
  (if (null input)
      (error "Unexpected end of input in parse-expression")
      (let ((first-symbol (first input)))  ;; Ensure we're working with a symbol
        (cond
          ((eq first-symbol ']) (rest input))  ;; Successfully parsed, return remaining input
          ((identifierp first-symbol) (parse-expression (rest input)))  ;; Keep parsing valid identifiers
          (t (error "Invalid identifier inside brackets"))))))  ;; Catch non-identifiers

(defun parse-new (input)
  "Handles the optional expression in brackets."
  (if (null input)
      input  ;; No brackets, return input as is
      (let ((first-symbol (first input)))  ;; Use symbols instead of characters
        (cond
          ((eq first-symbol '[) (parse-expression (rest input))) ;; Properly process bracketed expressions
          (t input)))))

(defun parse-variable (input)
  "Parses a variable, which can be either an identifier or an identifier followed by an expression in brackets."
  (if (null input)
      (error "Unexpected end of input in parse-variable")
      (let ((first-symbol (first input)))  ;; Ensure proper symbol handling
        (if (identifierp first-symbol)  ;; Check symbol name
            (parse-new (rest input))
            (error "Expected identifier at beginning of variable")))))