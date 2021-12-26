defmodule MagicalMake.FontTest do
  use ExUnit.Case

  test "create_decoration" do
    assert MagicalMake.Font.create_decoration() =~ "\e"
  end
end
