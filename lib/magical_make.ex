defmodule MagicalMake do
  import MagicalMake.Circle, only: [draw_circle: 2]
  import MagicalMake.Font, only: [create_decoration: 1]
  import MagicalMake.Make, only: [exec_make: 1, make_check!: 0, draw_make: 3]
  @interval 200
  @final_interval 1000

  @moduledoc """
  Documentation for `MagicalMake`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MagicalMake.execute(:test_command)
      :world

  """
  def execute(make_command) do
    make_check!()
    font_decoration = create_decoration([])

    draw_circle(@interval, font_decoration)
    |> draw_make(make_command, @final_interval)

    exec_make(make_command)
    :ok
  end
end
