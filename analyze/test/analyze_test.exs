defmodule AnalyzeTest do
  use ExUnit.Case
  doctest Analyze

  test "greets the world" do
    assert Analyze.hello() == :world
  end
end
