defmodule LakeDataTest do
  use ExUnit.Case
  doctest LakeData

  test "Lake Level Calculation" do
    assert 581.47 == LakeData.water_level_from_dock 0.0
    assert 579.8033333333334 == LakeData.water_level_from_dock 20.0
  end
end
