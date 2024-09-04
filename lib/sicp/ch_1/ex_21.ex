defmodule SICP.Ch1.Ex21 do
  @moduledoc """
  Task:

  Use the smallest-divisor procedure to find the smallest divisor of each of the
  following numbers: `199`, `1999`, `19999`.

  Answer:

      iex> SICP.Ch1.Ex21.smallest_divisor(199)
      199

      iex> SICP.Ch1.Ex21.smallest_divisor(1_999)
      1999

      iex> SICP.Ch1.Ex21.smallest_divisor(19_999)
      7
  """

  @spec smallest_divisor(integer()) :: integer()
  def smallest_divisor(n), do: find_divisor(n, 2)

  @spec find_divisor(integer(), integer()) :: pos_integer()
  defp find_divisor(n, test_divisor) do
    cond do
      square(test_divisor) > n -> n
      divides?(test_divisor, n) -> test_divisor
      true -> find_divisor(n, test_divisor + 1)
    end
  end

  @spec square(number()) :: number()
  defp square(x), do: x * x

  @spec divides?(integer(), integer()) :: boolean()
  defp divides?(a, b), do: rem(b, a) == 0
end
