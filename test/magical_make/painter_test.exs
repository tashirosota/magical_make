defmodule MagicalMake.PainterTest do
  use ExUnit.Case

  test "draw" do
    assert MagicalMake.Painter.draw("text", 100) == :ok
  end
end
