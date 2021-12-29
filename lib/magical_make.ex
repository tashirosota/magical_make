defmodule MagicalMake do
  import MagicalMake.Setup, only: [prepare: 2]
  import MagicalMake.Circle, only: [select: 0]
  import MagicalMake.Font, only: [create_decoration: 1]
  import MagicalMake.Painter, only: [draw: 2]
  import MagicalMake.SystemCommand, only: [make: 1, make_check!: 0]
  @interval 500
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
    prepare(@interval, font_decoration)
    (font_decoration <> select()) |> draw(@final_interval)
    make(make_command)
    :ok
  end
end
