defmodule MagicalMake.Setup do
  import MagicalMake.Painter
  import MagicalMake.Circle
  import MagicalMake.SystemCommand

  @setup_files %{
    small: "lib/texts/setup/small/",
    medium: "lib/texts/setup/medium/",
    large: "lib/texts/setup/large/"
  }

  def prepare(interval, font_decoration) do
    prepare(get_files(), interval, font_decoration)
  end

  defp prepare([file | files], interval, font_decoration) do
    (font_decoration <> read_text(file)) |> draw(interval)
    prepare(files, interval, font_decoration)
  end

  defp prepare([], _, _), do: :ok

  defp get_files do
    cols = sys_cmd(:cols) |> elem(0) |> String.replace("\n", "") |> String.to_integer()

    cond do
      cols > 300 ->
        @setup_files.large |> File.ls() |> elem(1) |> Enum.map(&(@setup_files.large <> &1))

      cols > 150 ->
        @setup_files.medium |> File.ls() |> elem(1) |> Enum.map(&(@setup_files.medium <> &1))

      true ->
        @setup_files.small |> File.ls() |> elem(1) |> Enum.map(&(@setup_files.small <> &1))
    end
  end
end
