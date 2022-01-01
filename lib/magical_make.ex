defmodule MagicalMake do
  import MagicalMake.Circle, only: [draw_circle: 2]
  import MagicalMake.Font, only: [create_decoration: 0]
  import MagicalMake.Make, only: [exec_make: 1, make_check!: 0, draw_make: 3]
  @versoin "0.1.2"
  @interval 200
  @final_interval 1000

  @spec execute(String.t()) :: :ok
  def execute(make_command) do
    make_check!()
    font_decoration = create_decoration()

    draw_circle(@interval, font_decoration)
    |> draw_make(make_command, @final_interval)

    exec_make(make_command)
    :ok
  end

  @spec version :: String.t()
  def version do
    @versoin
  end
end
