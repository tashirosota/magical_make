defmodule MagicalMake.SystemCommand do
  @make "make"
  @commands [
    cols: %{
      command: "tput",
      args: ["cols"],
      opts: []
    },
    clear: %{
      command: "printf",
      args: ["'\e[2J\e[3J\e[H'"],
      opts: [into: IO.stream(:stdio, :line)]
    },
    font_reset: %{
      command: "tput",
      args: ["sgr0"],
      opts: [into: IO.stream(:stdio, :line)]
    }
  ]

  def make_check! do
    System.find_executable(@make) ||
      raise MagicalMake.MakefileMissing,
        message: "Makefile does not exist. Must exist in current directory."

    :ok
  end

  def make(command) do
    exec(
      "make",
      [command |> to_string()],
      [into: IO.stream(:stdio, :line)]
    )
  end

  def sys_cmd(command) do
    command_map = Keyword.fetch!(@commands, command)

    exec(
      command_map.command,
      command_map.args,
      command_map.opts
    )
  end

  defp exec(command, args, opts \\ []) do
    System.cmd(
      command,
      args,
      opts
    )
  end
end
