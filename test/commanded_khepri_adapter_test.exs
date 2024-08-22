defmodule CommandedKhepriAdapterTest do
  use ExUnit.Case
  doctest CommandedKhepriAdapter

  test "greets the world" do
    assert CommandedKhepriAdapter.hello() == :world
  end
end
