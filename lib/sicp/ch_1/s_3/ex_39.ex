defmodule Sicp.Ch1.S3.Ex39 do
  @moduledoc """
  Task:

  A continued fraction representation of the
  tangent function was published in 1770 by the German mathematician J.H. Lambert:

  ```
                x
  tan x = ---------------.
                  x²
          1 - -----------
                    x²
              3 - -------
                  5 - ...
  ```

  where x is in radians. Define a procedure `(tan-cf x k)` that
  computes an approximation to the tangent function based
  on Lambert’s formula. `k` specifies the number of terms to
  compute, as in Exercise 1.37.
  """

  import Sicp.Ch1.S3.Ex37, only: [cont_frac_iter: 3]

  @spec tan_cf(number(), pos_integer()) :: number()
  def tan_cf(x, k) do
    n = fn
      1 -> x
      _ -> -(x * x)
    end

    d = fn step -> 2 * step - 1 end

    cont_frac_iter(n, d, k)
  end
end
