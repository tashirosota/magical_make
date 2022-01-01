defmodule MagicalMake.Circle do
  @moduledoc """
  For Magic circle's ascii art.
  """
  @last_word "M"
  @gsub_words [
    ".",
    ";",
    "i",
    "I",
    @last_word
  ]
  @assets_path "priv/assets/circles/"
  # https://elixirforum.com/t/is-it-possible-to-include-resource-files-when-packaging-my-project-using-mix-escript/730/11
  @circle_texts [
    elem(File.read(@assets_path <> "1.txt"), 1),
    elem(File.read(@assets_path <> "2.txt"), 1),
    elem(File.read(@assets_path <> "3.txt"), 1),
    elem(File.read(@assets_path <> "4.txt"), 1),
    elem(File.read(@assets_path <> "5.txt"), 1)
  ]

  @doc """
  Puts Magic circle's ascii art and refresh.
  Draws gradually with each words[".", ":", ";", "I", "M"]
  """
  @spec draw_circle(non_neg_integer(), String.t()) :: String.t()
  def draw_circle(interval, font_decoration) do
    circle_txt = @circle_texts |> Enum.random()

    Enum.each(@gsub_words ++ [], fn word ->
      (font_decoration <> String.replace(circle_txt, ~r/\S/, word))
      |> MagicalMake.Painter.draw(interval)
    end)

    font_decoration <> String.replace(circle_txt, ~r/\S/, @last_word)
  end
end
