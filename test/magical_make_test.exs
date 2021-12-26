defmodule MagicalMakeTest do
  use ExUnit.Case
  # TODO: doctestに関して
  # doctest MagicalMake

  test ".execute" do
    cmd = "test_command"
    assert_raise MagicalMake.CommandMissing,"`#{cmd}` is missing in Makefile（or Magicfile, Grimoire）", fn ->
      MagicalMake.execute(cmd)
    end
  end
end
