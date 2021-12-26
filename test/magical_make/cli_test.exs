defmodule MagicalMake.CLITest do
  use ExUnit.Case

  test "main" do
    cmd = "test_command"

    assert_raise MagicalMake.CommandMissing,
                 "`#{cmd}` is missing in Makefile（or Magicfile, Grimoire）",
                 fn ->
                   MagicalMake.CLI.main(cmd)
                 end
  end
end
