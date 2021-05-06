defmodule ChirpstackGrpcTest do
  use ExUnit.Case
  doctest ChirpstackGrpc

  test "greets the world" do
    assert ChirpstackGrpc.hello() == :world
  end
end
