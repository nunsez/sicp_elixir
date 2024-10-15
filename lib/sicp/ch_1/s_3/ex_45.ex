defmodule Sicp.Ch1.S3.Ex45 do
  @moduledoc """
  Task:

  We saw in Section 1.3.3 that attempting to compute square roots by naively
  finding a fixed point of `y |-> x/y` does not converge, and that this can be
  fixed by average damping. The same method works for finding cube roots as fixed
  points of the average-damped `y |-> x/y²`. Unfortunately, the process does not
  work for fourth roots — a single average damp is not enough to make a fixed-point
  search for `y |-> x/y³` converge.
  On the other hand, if we average damp twice (i.e., use the average damp of the
  average damp of `y |-> x/y³`) the fixed-point search does converge. Do some
  experiments to determine how many average damps are required to compute `nᵗʰ`
  roots as a fixedpoint search based upon repeated average damping of
  `y |-> x/yⁿ⁻¹`.
  Use this to implement a simple procedure for computing `nᵗʰ` roots using
  `fixed-point`, `average-damp`, and the `repeated` procedure of Exercise 1.43.
  Assume that any arithmetic operations you need are available as primitives.

  Answer:

  Let's define the damps value:

  ```
  nth_root(8, 3, 1) ~= 2
  nth_root(16, 3, 1) doesn't converge
  nth_root(16, 4, 2) ~= 2
  ...
  nth_root(128, 7, 2) ~= 2
  nth_root(256, 8, 3) doesn't converge
  nth_root(256, 8, 3) ~= 2
  ...
  nth_root(32_768, 15, 3) ~= 2
  nth_root(65_536, 16, 3) doesn't converge
  nth_root(65_536, 16, 4)

  ----------------------
  | damps | 1 | 2 |  3 |
  |-------|---|---|----|
  | roots | 3 | 7 | 15 |
  ----------------------

  roots = 2^(damps + 1) - 1
  damps = log2(roots + 1) - 1
  ```
  """

  import Sicp.Common, only: [cube: 1]
  import Sicp.Ch1.S2.Ex25, only: [fast_expt: 2]
  import Sicp.Ch1.S3, only: [fixed_point: 3, average_damp: 1]
  import Sicp.Ch1.S3.Ex43, only: [repeated: 2]

  @spec sqrt(number()) :: number()
  def sqrt(x) do
    f0 = fn y -> x / y end
    f1 = average_damp(f0)
    fixed_point(f1, 1.0, tolerance())
  end

  @doc """
  Doesn't converge with one avergae damping
  """
  @spec fourth_root(number()) :: no_return()
  def fourth_root(x) do
    f0 = fn y -> x / cube(y) end
    f1 = average_damp(f0)
    fixed_point(f1, 1.0, tolerance())
  end

  @dialyzer {:nowarn_function, nth_root: 3}

  @doc """
  Function for the nᵗʰ root of a number with configurable damps
  """
  @spec nth_root(pos_integer(), pos_integer(), pos_integer()) :: number()
  def nth_root(x, root, damps) do
    f0 = fn y -> x / fast_expt(y, root - 1) end

    f1 = repeated(&average_damp/1, damps)
    f3 = f1.(f0)

    fixed_point(f3, 1.0, tolerance())
  end

  @dialyzer {:nowarn_function, nth_root: 2}

  @doc """
  Function for the root nᵗʰ of a number with automatically calculated damps
  """
  @spec nth_root(pos_integer(), pos_integer()) :: number()
  def nth_root(x, root) do
    f0 = fn y -> x / fast_expt(y, root - 1) end

    damps = get_dumps(root)
    f1 = repeated(&average_damp/1, damps)
    f3 = f1.(f0)

    fixed_point(f3, 1.0, tolerance())
  end

  @doc """
  damps = log2(roots + 1) - 1
  """
  @spec get_dumps(pos_integer()) :: pos_integer()
  def get_dumps(root) do
    ceil(:math.log2(root + 1) - 1)
  end

  @spec tolerance() :: float()
  def tolerance do
    0.00001
  end
end
