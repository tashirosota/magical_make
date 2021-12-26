defmodule MagicalMake.Circle do
  @text_file_numbers 1..23
  def select do
    "lib/texts/circles/#{@text_file_numbers |> Enum.random()}.txt"
    |> read_text()
  end

  def read_text(file_path) do
    {:ok, text} = file_path |> File.read()
    text
  end
end
