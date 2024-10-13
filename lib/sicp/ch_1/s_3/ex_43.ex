defmodule Sicp.Ch1.S3.Ex43 do
  @moduledoc """
  Task:

  If `f` is a numerical function and `n` is a positive integer, then we can form the
  `nᵗʰ` repeated application of `f`, which is defined to be the function whose value
  at `x` is `f(f(...(f(x))...))`. For example, if `f` is the function `x |-> x + 1`, then
  the `nᵗʰ` repeated application of `f` is the function `x |-> x + n`. If `f` is the
  operation of squaring a number, then the `nᵗʰ` repeated application of `f` is the
  function that raises its argument to the `2ⁿ-th` power. Write a procedure that
  takes as inputs a procedure that computes `f` and a positive integer `n` and
  returns the procedure that computes the `nᵗʰ` repeated application of `f`. Your
  procedure should be able to be used as follows:

  ```scheme
  ((repeated square 2) 5)
  625
  ```

  Hint: You may find it convenient to use compose from Exercise 1.42.
  """

  import Sicp.Ch1.S3.Ex42, only: [compose: 2]

  @spec repeated((number() -> number()), pos_integer()) :: (number() -> number())
  def repeated(f, n) do
    repeated(f, n, f)
  end

  @spec repeated((number() -> number()), pos_integer(), (number() -> number())) ::
          (number() -> number())
  def repeated(_, n, result) when n <= 1 do
    result
  end

  def repeated(f, n, result) do
    repeated(f, n - 1, compose(f, result))
  end
end
