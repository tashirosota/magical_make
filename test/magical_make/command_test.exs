defmodule MagicalMake.CommandTest do
  use ExUnit.Case

  test "find!" do
    assert MagicalMake.Command.check!() == :ok
  end
end
