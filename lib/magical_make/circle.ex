defmodule MagicalMake.Circle do
  @txt_file_numbers 1..5
  @last_word "M"
  @gsub_words [
    ".",
    ";",
    "i",
    "I",
    @last_word
  ]

  def draw_circle(interval, font_decoration) do
    {:ok, circle_txt} =
      "lib/texts/circles/#{@txt_file_numbers |> Enum.random()}.txt" |> File.read()

    Enum.each(@gsub_words ++ [], fn word ->
      (font_decoration <> String.replace(circle_txt, ~r/\S/, word))
      |> MagicalMake.Painter.draw(interval)
    end)

    font_decoration <> String.replace(circle_txt, ~r/\S/, @last_word)
  end
end
