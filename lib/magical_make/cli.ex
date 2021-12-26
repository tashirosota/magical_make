defmodule MagicalMake.CLI do
  def main(make_command) do
    make_command
    |> MagicalMake.execute()
  end
end
