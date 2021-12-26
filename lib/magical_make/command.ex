defmodule MagicalMake.Command do
  @make "make"
  def check! do
    System.find_executable(@make) ||
      raise MagicalMake.MakefileMissing,
        message: "Makefile does not exist. Must exist in current directory."

    :ok
  end

  def make_exec(command) do
    "make #{command}" |> String.to_charlist() |> :os.cmd()
  end
end
