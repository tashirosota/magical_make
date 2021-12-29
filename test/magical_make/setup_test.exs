defmodule MagicalMake.SetupTest do
  use ExUnit.Case
  import MagicalMake.Font

  test "prepare" do
    interval = 1000
    font_decoration = create_decoration()
    assert MagicalMake.Setup.prepare(interval, font_decoration) == :ok
  end
end
