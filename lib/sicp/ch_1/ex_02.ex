defmodule SICP.Ch1.Ex02 do
  @moduledoc """
  Task:

  Translate the following expression into prefix form

  ```
  5 + 4 + (2 − (3 − (6 + 4/5)))
  -----------------------------
        3(6 - 2)(2 - 7)
  ```

  Answer:

  ```scheme
  (/ (+ 5
        4
        (- 2
           (- 3
              (+ 6
                 (/ 4 5)))))
     (* 3
        (- 6 2)
        (- 2 7)))
  ```
  """
end
