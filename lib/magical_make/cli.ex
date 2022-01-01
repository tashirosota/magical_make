defmodule MagicalMake.CLI do
  @moduledoc """
  CLI module for escript.
  """
  @option %{
    help: ["help", "-h", "--help"],
    version: ["version", "-v", "--version"]
  }

  @doc """
  Main function for escript.You can use `help`, `version` and make command executable.
  ## Examples
      iex> MagicalMake.CLI.main("hello")
      # Exec make hello
      :ok
      iex> MagicalMake.CLI.main("-v")
      # Displays version
      :version
  """
  @spec main(any) :: :help | :version | :ok
  def main(args \\ []) do
    case parse_args(args) do
      {:ok, make_command} -> make_command |> MagicalMake.execute()
      {_, command} -> command |> option_exec()
    end
  end

  defp parse_args(args) do
    str_args = args |> Enum.map(&to_string(&1))

    cond do
      find_option(@option.help, str_args) -> {:option, :help}
      find_option(@option.version, str_args) -> {:option, :version}
      true -> {:ok, str_args |> Enum.join(" ")}
    end
  end

  defp find_option(option, args) do
    args
    |> Enum.find(fn arg ->
      option
      |> Enum.find(&(&1 == arg))
    end)
  end

  defp option_exec(option_cmd) do
    case option_cmd do
      :help ->
        """
        usage: mgc [version | -v | --version]
                   [help | -h | --help]
                   <make command>

        mgc <make command> is to start make <make command>
        """

      :version ->
        "magical make version " <> MagicalMake.version()
    end
    |> IO.puts()

    option_cmd
  end
end
