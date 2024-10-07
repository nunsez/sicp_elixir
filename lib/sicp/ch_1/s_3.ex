defmodule Sicp.Ch1.S3 do
  @moduledoc false

  @spec tolerance() :: float()
  def tolerance do
    0.000_01
  end

  @spec fixed_point((number() -> number()), number()) :: number()
  def fixed_point(f, first_guess) do
    try1(f, first_guess)
  end

  @spec close_enough?(number(), number()) :: boolean()
  def close_enough?(v1, v2) do
    abs(v1 - v2) < tolerance()
  end

  @spec try1((number() -> number()), number()) :: number()
  def try1(f, guess) do
    next = f.(guess)

    if close_enough?(guess, next) do
      next
    else
      try1(f, next)
    end
  end
end
