defmodule MagicalMake.Make do
  @make "make"
  @asc_word "※"
  @pin_word "@"
  @make_y_range 1..8
  @make_x_range 0..100
  @circle_x_center 75
  @ciercle_y_make_start 17

  def make_check! do
    System.find_executable(@make) ||
      raise MagicalMake.MakefileMissing,
        message: "Makefile does not exist. Must exist in current directory."

    :ok
  end

  def exec_make(command) do
    MagicalMake.SystemCommand.exec(
      @make,
      [command |> to_string()],
      into: IO.stream(:stdio, :line)
    )
  end

  def draw_make(circle_text, make_command, interval) do
    create_make_art(circle_text, make_command)
    |> MagicalMake.Painter.draw(interval)
  end

  defp create_make_art(circle_text, make_command) do
    make_texts = create_make_texts(make_command)

    circle_text
    |> String.split("\n")
    |> Enum.with_index(fn text, index ->
      if index >= @ciercle_y_make_start && index < @ciercle_y_make_start + Enum.count(make_texts) do
        make_texts |> Enum.at(index - @ciercle_y_make_start)
      else
        text
      end
    end)
    |> Enum.join("\n")
  end

  defp create_make_texts(make_command) do
    {:ok, font} = Chisel.Font.load("lib/texts/5x8.bdf")

    {pixels, _, _} =
      Chisel.Renderer.reduce_draw_text(
        @make <> " " <> make_command,
        0,
        0,
        font,
        [],
        fn x, y, pixels -> [{x, y} | pixels] end
      )

    make_texts =
      Enum.map(@make_y_range, fn y ->
        Enum.map(@make_x_range, fn x ->
          if Enum.member?(pixels, {x, y}), do: @asc_word, else: " "
        end) ++ ["\n"]
      end)

    make_x_center = max_x_length(make_texts) |> div(2)
    space_count = @circle_x_center - make_x_center
    spaces = Enum.map(0..(space_count - 1), fn _ -> " " end)
    fin_make_texts = make_texts |> Enum.map(fn words -> spaces ++ words end)

    [_ | tail] =
      (create_partition() ++ fin_make_texts ++ create_partition())
      |> Enum.join()
      |> String.split("\n")
      |> Enum.reverse()

    tail |> Enum.reverse()
  end

  defp create_partition() do
    Enum.map(0..(@circle_x_center * 2 - 1), fn _ -> "=" end) ++ ["\n"]
  end

  defp max_x_length(make_text) do
    reversed_longest_words =
      make_text
      |> Enum.min_by(fn make_words ->
        make_words
        |> Enum.reverse()
        |> Enum.find_index(fn word -> word == @asc_word end)
      end)
      |> Enum.reverse()

    index = reversed_longest_words |> Enum.find_index(fn word -> word == @asc_word end)

    reversed_longest_words
    |> List.replace_at(index, @pin_word)
    |> Enum.reverse()
    |> Enum.find_index(fn word -> word == @pin_word end)
  end
end
