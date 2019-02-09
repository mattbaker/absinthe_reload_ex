defmodule AbsintheReloadTest do
  use ExUnit.Case
  doctest AbsintheReload

  test "greets the world" do
    assert AbsintheReload.hello() == :world
  end
end
