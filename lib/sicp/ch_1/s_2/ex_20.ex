defmodule Sicp.Ch1.S2.Ex20 do
  @moduledoc """
  Task:

  The process that a procedure generates is of course dependent on the rules used
  by the interpreter. As an example, consider the iterative `gcd` procedure given
  above. Suppose we were to interpret this procedure using normal-order
  evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule
  for `if` is described in exercise 1.5.) Using the substitution method (for normal
  order), illustrate the process generated in evaluating `(gcd 206 40)` and
  indicate the remainder operations that are actually performed. How many
  remainder operations are actually performed in the normal-order evaluation of
  `(gcd 206 40)`? In the applicative-order evaluation?

  Answer:

  ```scheme
  (define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
  ```

  Normal-order evaluation:

  ```scheme
  ;; iteration (gcd 206 40)
  (gcd 206 40)

  ;; condition
  (if (= 40 0)
      a
      gcd) -> false ; remainder calls: 0

  ;; iteration (gcd 40 6)
  (gcd 40
       (remainder 206 40))

  ;; condition
  (if (= (remainder 206 40)
         0)
      a
      gcd) -> false ; remainder calls: 0 + 1

  ;; iteration (gcd 6 4)
  (gcd (remainder 206 40)
       (remainder 40
                  (remainder 206 40)))

  ;; condition
  (if (= (remainder 40
                    (remainder 206 40))
         0)
      a
      gcd) -> false ; remainder calls: 0 + 1 + 2

  ;; iteration (gcd 4 2)
  (gcd (remainder 40
                  (remainder 206 40))
       (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40))))

  ;; condition
  (if (= (remainder (remainder 206 40)
                    (remainder 40
                               (remainder 206 40)))
         0))
      a
      gcd) -> false ; remainder calls: 0 + 1 + 2 + 4

  ;; iteration (gcd 2 0)
  (gcd (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40)))
       (remainder (remainder 40
                             (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40)))))

  ;; condition
  (if (= (remainder (remainder 40
                               (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40
                                          (remainder 206 40))))
         0))
      a
      gcd) -> true ; remainder calls: 0 + 1 + 2 + 4 + 7
  ;; => a

  ;; return a, remainder calls: 4
  (remainder (remainder 206 40)
             (remainder 40
                        (remainder 206 40)))

  ;; Remainder call times from conditions: 0 + 1 + 2 + 4 + 7 = 14
  ;; Remainder call times from returning `a`: 4

  ;; Total remainder call times: 14 + 4 = 18
  ```

  Applicative-order evaluation:

  ```scheme
  ;; iteration (gcd 206 40)
  (gcd 206 40)

  ;; condition
  (if (= 40 0) a gcd) -> false ; remainder calls: 0

  ;; iteration (gcd 40 6)
  (gcd 40 (remainder 206 40)) ; remainder calls: 0 + 1

  ;; condition
  (if (= 6 0) 40 gcd) -> false ; 0 + 1

  ;; iteration (gcd 6 4)
  (gcd 6 (remainder 40 6)) ; remainder calls: 0 + 1 + 1

  ;; condition
  (if (= 4 0) 6 gcd) -> false ; remainder calls: 0 + 1 + 1

  ;; iteration (gcd 4 2)
  (gcd 4 (remainder 6 4)) ; remainder calls: 0 + 1 + 1 + 1

  ;; condition
  (if (= 2 0) 4 gcd) -> false ; remainder calls: 0 + 1 + 1 + 1

  ;; iteration (gcd 2 0)
  (gcd 2 (remainder 4 2)) ; remainder calls: 0 + 1 + 1 + 1 + 1

  ;; condition
  (if (= 0 0) 2 gcd)
  => 2

  ;; Total remainder call times: 4
  ```
  """
end
