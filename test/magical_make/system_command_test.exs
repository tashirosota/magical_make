defmodule MagicalMake.SystemCommandTest do
  use ExUnit.Case

  test "make_check!" do
    assert MagicalMake.SystemCommand.make_check!() == :ok
  end
end