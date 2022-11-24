defmodule SICP.Ch1.Ex04 do
  @moduledoc """
  Task:

  Observe that our model of evaluation allows for combinations whose operators
  are compound expressions. Use this observation to describe the behavior of the
  following procedure:

  ```scheme
    (define (a-plus-abs-b a b)
      ((if (> b 0) + -) a b))
  ```

  Answer:

  The procedure a-plus-abs-b determines the operator (`+` or `-`) depending on the
  sign of the variable `b`.

  If b is a positive:

  ```scheme
    (define (a-plus-abs-b a b)
      (+ a b)
  ```

  If b is a negative or zero:

  ```scheme
    (define (a-plus-abs-b a b)
      (- a b)
  ```
  """
end
