defmodule MagicalMake.CircleTest do
  use ExUnit.Case
  doctest MagicalMake.Circle

  test "select" do
    assert MagicalMake.Circle.select() =~ "MAGICAL MAKE"
  end
end
