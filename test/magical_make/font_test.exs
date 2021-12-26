defmodule MagicalMake.FontTest do
  use ExUnit.Case

  test "decorate" do
    assert MagicalMake.Font.decorate("aaa") =~ "\e"
  end
end
