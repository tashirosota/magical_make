defmodule MagicalMake.Painter do
  import MagicalMake.SystemCommand

  def draw(text, interval) do
    IO.puts(text)
    Process.sleep(interval)
    refresh!()
    :ok
  end

  def refresh! do
    :font_reset |> sys_cmd()
    :clear |> sys_cmd()
  end
end
