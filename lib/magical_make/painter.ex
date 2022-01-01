defmodule MagicalMake.Painter do
  import MagicalMake.SystemCommand

  @spec draw(String.t(), non_neg_integer()) :: :ok
  def draw(text, interval) do
    IO.puts(text)
    Process.sleep(interval)
    refresh!()
    :ok
  end

  @spec refresh! :: :ok
  def refresh! do
    :font_reset |> sys_cmd()
    :clear |> sys_cmd()
    :ok
  end
end
