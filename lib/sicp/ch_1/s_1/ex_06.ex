defmodule Sicp.Ch1.S1.Ex06 do
  @moduledoc """
  Task:

  lyssa P. Hacker doesn't see why if needs to be provided as a special form. "Why
  can't I just define it as an ordinary procedure in terms of cond?" she asks.
  Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a
  new version of if:

  ```scheme
  (define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))
  ```

  Eva demonstrates the program for Alyssa:

  ```scheme
  (new-if (= 2 3) 0 5)
  5

  (new-if (= 1 1) 0 5)
  0
  ```

  Delighted, Alyssa uses new-if to rewrite the square-root program:

  ```scheme
  (define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                       x)))
  ```

  What happens when Alyssa attempts to use this to compute square roots? Explain.

  Answer:

  Because of applicative-order evaluation, Scheme interpreter tries to evaluate
  `then-clause` and `else-clause` of `new-if` procedure. Evaluation of `else-clause`
  will never terminate because it contains recursive call to `sqrt-iter`, which calls
  `else-clause` of `new-if` inside itself again.

  We can use `cond` form this way and it will work:

  ```scheme
  (define (sqrt-iter guess x)
    (cond ((good-enough? guess x) guess)
          (else (sqrt-iter (improve guess x)
                           x))))
  ```
  """
end
