defmodule MagicalMakeTest do
  use ExUnit.Case
  # TODO: doctestに関して
  # doctest MagicalMake

  test ".execute" do
    cmd = "hello"

    assert MagicalMake.execute(cmd) == :ok
  end
end
