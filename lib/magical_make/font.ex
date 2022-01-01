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

  @spec create_decoration :: String.t()
  def create_decoration() do
    @colors |> Keyword.values() |> Enum.random()
  end
end
