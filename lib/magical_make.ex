defmodule MagicalMake do
  import MagicalMake.Circle, only: [draw_circle: 2]
  import MagicalMake.Font, only: [create_decoration: 1]
  import MagicalMake.Painter, only: [draw: 2]
  import MagicalMake.SystemCommand, only: [make: 1, make_check!: 0]
  @interval 300
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
    circle_text = draw_circle(@interval, font_decoration)
    make(make_command)
    :ok
  end
end
