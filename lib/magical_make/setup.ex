defmodule MagicalMake.Setup do
  import MagicalMake.Painter
  import MagicalMake.Circle

  @setup_files [
    "lib/texts/setup/1.txt",
    "lib/texts/setup/2.txt",
    "lib/texts/setup/3.txt",
    "lib/texts/setup/4.txt",
    "lib/texts/setup/5.txt"
  ]

  def prepare(interval, font_decoration) do
    prepare(@setup_files, interval, font_decoration)
  end

  defp prepare([file | files], interval, font_decoration) do
    (font_decoration <> read_text(file)) |> draw(interval)
    prepare(files, interval, font_decoration)
  end

  defp prepare([], interval, font_decoration), do: :ok
end
