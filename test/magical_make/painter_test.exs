defmodule MagicalMake.PainterTest do
  use ExUnit.Case

  test "draw" do
    text = MagicalMake.Circle.select()

    assert MagicalMake.Painter.draw(text, 100) == :ok
  end
end
