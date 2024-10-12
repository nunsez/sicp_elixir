defmodule Sicp.Ch1.S3.Ex40 do
  @moduledoc """
  Task:

  Define a procedure `cubic` that can be used together with the
  `newtons-method` procedure in expressions
  of the form

  ```scheme
  (newtons-method (cubic a b c) 1)
  ```

  to approximate zeros of the cubic `x³ + ax² + bx + c`
  """

  import Sicp.Common, only: [cube: 1, square: 1]

  @spec cubic(number(), number(), number()) :: (number() -> number())
  def cubic(a, b, c) do
    fn x -> cube(x) + a * square(x) + b * x + c end
  end
end
