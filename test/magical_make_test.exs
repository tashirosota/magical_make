defmodule MagicalMakeTest do
  use ExUnit.Case
  doctest MagicalMake

  test "greets the world" do
    assert MagicalMake.hello() == :world
  end
end
