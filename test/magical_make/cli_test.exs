defmodule MagicalMake.CLITest do
  use ExUnit.Case

  test "main" do
    cmd = "hello"

    assert MagicalMake.CLI.main(cmd) == :ok
  end
end
