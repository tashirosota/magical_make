defmodule MagicalMake.Circle do
  @text_file_numbers 1..23
  def select do
    {:ok, text} = "lib/texts/circles/#{@text_file_numbers |> Enum.random()}.txt" |> File.read()
    text
  end
end
