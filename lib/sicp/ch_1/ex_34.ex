defmodule SICP.Ch1.Ex34 do
  @moduledoc """
  Task:

  Suppose we define the procedure

  ```sheme
  (define (f g) (g 2))
  ```

  Then we have

  ```scheme
  (f square)
  4
  (f (lambda (z) (* z (+ z 1))))
  6
  ```

  What happens if we (perversely) ask the interpreter to evaluate the combination
  `(f f)`? Explain.

  Answer:

  We will give an error because `2` is not an operator:

  `(f f)` -> `(f 2)` -> `(2 2)`
  """
end
