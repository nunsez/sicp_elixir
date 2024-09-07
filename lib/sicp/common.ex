defmodule SICP.Common do
  @moduledoc """
  A module of common functions uused in exercises which do not particularly
  participate in solution design but are used only as helpers and can be shared
  """

  import Bitwise, only: [<<<: 2, >>>: 2]

  require Integer

  @spec square(number()) :: number()
  def square(x), do: x * x

  @spec cube(number()) :: number()
  def cube(x), do: x * x * x

  @spec even?(integer()) :: boolean()
  def even?(x), do: Integer.is_even(x)

  @spec odd?(integer()) :: boolean()
  def odd?(x), do: Integer.is_odd(x)

  @spec double(integer()) :: integer()
  def double(integer), do: integer <<< 1

  @spec halve(integer()) :: integer()
  def halve(integer) when Integer.is_even(integer), do: integer >>> 1

  @spec remainder(integer(), pos_integer()) :: non_neg_integer()
  def remainder(a, b), do: Integer.mod(a, b)

  @spec random(pos_integer()) :: non_neg_integer()
  def random(n), do: :rand.uniform(n) - 1
end
