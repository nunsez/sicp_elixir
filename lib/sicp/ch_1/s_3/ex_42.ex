defmodule Sicp.Ch1.S3.Ex42 do
  @moduledoc """
  Task:

  Let f and g be two one-argument functions. The `composition` `f` after `g` is defined
  to be the function `x |-> f(g(x))`. Define a procedure compose that implements
  composition. For example, if inc is a procedure that adds 1 to its argument,

  ```scheme
  ((compose square inc) 6)
  ```
  """

  @spec compose((number() -> number()), (number() -> number())) :: (number() -> number())
  def compose(f, g) do
    fn x -> f.(g.(x)) end
  end
end
