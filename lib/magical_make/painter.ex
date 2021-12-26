defmodule MagicalMake.Painter do
  @clear_command "'\e[2J\e[3J\e[H'"
  @reset_font_code "\e[0m"
  def draw(text, interval) do
    IO.puts(text)
    Process.sleep(interval)
    refresh!()
    :ok
  end

  def refresh! do
    IO.puts(@reset_font_code)
    System.cmd("printf", [@clear_command], into: IO.stream(:stdio, :line))
  end
end
