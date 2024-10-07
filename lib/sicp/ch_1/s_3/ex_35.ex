defmodule Sicp.Ch1.S3.Ex35 do
  @moduledoc """
  Task:
  Show that the golden ratio `ϕ` (Section 1.2.2) is a fixed point of the
  transformation `x |-> 1 + 1/x`, and use this fact to compute `ϕ` by means
  of the `fixed-point` procedure.
  """

  import Sicp.Ch1.S3, only: [fixed_point: 2]

  @spec solution() :: number()
  def solution do
    f = fn x -> 1 + 1 / x end
    fixed_point(f, 1.0)
  end
end
