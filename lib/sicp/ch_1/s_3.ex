defmodule Sicp.Ch1.S3 do
  @moduledoc false

  import Sicp.Common, only: [average: 2]

  @spec tolerance() :: float()
  def tolerance do
    0.000_01
  end

  @spec fixed_point((number() -> number()), number(), number()) :: number()
  def fixed_point(f, first_guess, tolerance \\ tolerance()) do
    try1(f, first_guess, tolerance)
  end

  @spec try1((number() -> number()), number(), number()) :: number()
  def try1(f, guess, tolerance) do
    next = f.(guess)

    if close_enough?(guess, next, tolerance) do
      next
    else
      try1(f, next, tolerance)
    end
  end

  @spec close_enough?(number(), number(), number()) :: boolean()
  def close_enough?(v1, v2, tolerance \\ tolerance()) do
    abs(v1 - v2) < tolerance
  end

  @spec average_damp((number() -> number())) :: (number() -> number())
  def average_damp(f) do
    fn x -> average(x, f.(x)) end
  end

  @spec newtons_method((number() -> number()), number()) :: number()
  def newtons_method(g, guess) do
    fixed_point(newton_transform(g), guess)
  end

  @spec deriv((number() -> number())) :: (number() -> number())
  def newton_transform(g) do
    fn x -> x - g.(x) / deriv(g).(x) end
  end

  @spec deriv((number() -> number()), number()) :: (number() -> number())
  def deriv(g, dx \\ dx()) do
    fn x -> (g.(x + dx) - g.(x)) / dx end
  end

  @spec dx() :: float()
  def dx do
    0.000_01
  end
end
