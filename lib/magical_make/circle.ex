defmodule MagicalMake.Circle do
  @txt_file_numbers 1..5
  @gsub_words [
    ".",
    ";",
    "i",
    "I",
    "M"
  ]

  def draw_circle(interval, font_decoration) do
    circle_txt = "lib/texts/circles/#{@txt_file_numbers |> Enum.random()}.txt" |> read_text()

    Enum.each(@gsub_words, fn word ->
      (font_decoration <> String.replace(circle_txt, ~r/\S/, word))
      |> MagicalMake.Painter.draw(interval)
    end)

    [last_word | _] = Enum.reverse(@gsub_words)
    font_decoration <> String.replace(circle_txt, ~r/\S/, last_word)
  end

  defp read_text(file_path) do
    {:ok, text} = file_path |> File.read()
    text
  end
end
