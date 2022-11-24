defmodule SICP.Ch1.Ex05 do
  @moduledoc """
  Task:

  Ben Bitdiddle has invented a test to determine whether the interpreter he is
  faced with is using applicative-order evaluation or normal-order evaluation. He
  defines the following two procedures:

  ```scheme
  (define (p) (p))

  (define (test x y)
    (if (= x 0)
        0
        y))
  ```

  Then he evaluates the expression

  ```scheme
  (test 0 (p))
  ```

  What behavior will Ben observe with an interpreter that uses applicative-order
  evaluation? What behavior will he observe with an interpreter that uses
  normal-order evaluation? Explain your answer. (Assume that the evaluation rule
  for the special form if is the same whether the interpreter is using normal or
  applicative order: The predicate expression is evaluated first, and the result
  determines whether to evaluate the consequent or the alternative expression.)

  Answer:

  Applicative-order evaluation:

  ```scheme
  ;; The evaluation never ends because p is infinitely expanding

  (test 0 (p)) ; then (p) -> (p)
  (test 0 (p)) ; then (p) -> (p)
  (test 0 (p)) ; ect.
  ```

  Normal-order evaluation:

  ```scheme
  ;; The evaluation is performed step by step and ends with a result of 0

  (test 0 (p)) ; then enter test procedure

  (if (= x 0) 0 y) ; then x -> 0
  ;      \u2191

  (if (= 0 0) 0 y) ; then end if
  ;           \u2191

  0
  ```
  """
end
