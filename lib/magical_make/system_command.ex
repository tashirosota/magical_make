defmodule MagicalMake.SystemCommand do
  @commands [
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

  @spec sys_cmd(:clear | :font_reset) :: :ok
  def sys_cmd(command) do
    command_map = Keyword.fetch!(@commands, command)

    exec(
      command_map.command,
      command_map.args,
      command_map.opts
    )
  end

  @spec exec(binary, [binary], [
          {:arg0 | :cd | :env | :into | :parallelism | :stderr_to_stdout, any}
        ]) :: :ok
  def exec(command, args, opts) do
    System.cmd(
      command,
      args,
      opts
    )

    :ok
  end
end
