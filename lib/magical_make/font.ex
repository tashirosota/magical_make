defmodule MagicalMake.Font do
  @esc "\e"
  @colors [
    black: "#{@esc}[30m",
    red: "#{@esc}[31m",
    green: "#{@esc}[32m",
    yellow: "#{@esc}[33m",
    blue: "#{@esc}[34m",
    magenta: "#{@esc}[35m",
    cyan: "#{@esc}[36m"
  ]
  @bold "#{@esc}[1m"
  @italic "#{@esc}[3m"
  @double_underline "#{@esc}[21m"

  def create_decoration(opts \\ [color_code: nil, other_code: nil]) do
    color_code = Keyword.get(opts, :color_code) || @colors |> Keyword.values() |> Enum.random()
    other_code = Keyword.get(opts, :other_code) || ""
    color_code <> other_code
  end
end
