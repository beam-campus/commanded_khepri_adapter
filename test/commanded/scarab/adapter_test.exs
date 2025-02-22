defmodule Commanded.Khepri.AdapterTest do
  use ExUnit.Case
  doctest Commanded.Khepri.Adapter

  test "greets the world" do
    assert CommandedKhepriAdapter.hello() == :world
  end

end
