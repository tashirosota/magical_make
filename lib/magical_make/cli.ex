defmodule MagicalMake.CLI do
  def main(make_command) do
    make_command
    |> to_string()
    |> MagicalMake.execute()
  end
end
