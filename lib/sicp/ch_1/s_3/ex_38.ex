defmodule Sicp.Ch1.S3.Ex38 do
  @moduledoc """
  Task:

  In 1737, the Swiss mathematician Leonhard Euler published a memoir
  `De Fractionibus Continuis`, which included a continued fraction expansion
  for `e−2`, where `e` is the base of the natural logarithms. In this
  fraction, the `Nᵢ` are all `1`, and the `Dᵢ` are successively
  `1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...`.

  Write a program that uses your `cont-frac` procedure from Exercise 1.37 to
  approximate `e`, based on Euler’s expansion.
  """

  import Sicp.Ch1.S3.Ex37, only: [cont_frac_iter: 3]

  @spec e(pos_integer()) :: float()
  def e(k) do
    euler_e(k) + 2
  end

  @doc """
  The return value exuals `e-2`
  """
  @spec euler_e(pos_integer()) :: float()
  def euler_e(k) do
    n = fn _ -> 1 end
    cont_frac_iter(n, &d/1, k)
  end

  @spec d(integer()) :: integer()
  def d(step) do
    x = step + 1

    case rem(x, 3) do
      0 -> 2 * x / 3
      _ -> 1
    end
  end
end
