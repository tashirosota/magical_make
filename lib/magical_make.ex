defmodule MagicalMake do
  import MagicalMake.Directer, only: [prepare: 1]
  import MagicalMake.Circle, only: [select: 0]
  import MagicalMake.Font, only: [decorate: 1]
  import MagicalMake.Painter, only: [draw: 1]
  import MagicalMake.Command, only: [exec: 1, find: 1]
  @interval 0.2

  @moduledoc """
  Documentation for `MagicalMake`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MagicalMake.execute(:test_command)
      :world

  """
  def execute(make_command) do
    command =
      with {:ok, command} <- find(make_command) do
        command
      else
        _ ->
          raise MagicalMake.CommandMissing,
            message: "`#{make_command}` is missing in Makefile（or Magicfile, Grimoire）"
      end

    prepare(@interval)

    select()
    |> decorate()
    |> draw()

    Process.sleep(@interval)
    exec(command)
  end
end
