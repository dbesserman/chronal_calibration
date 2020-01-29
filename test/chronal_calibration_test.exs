defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  describe "compute_frequency/2" do
    test "returns the initial frequency when no frequency variations are passed in" do
      assert ChronalCalibration.computed_frequency(0) == 0
      assert ChronalCalibration.computed_frequency(1) == 1
    end

    test "adds the sum of the variations to the inital frequency if variations are passed in" do
      assert ChronalCalibration.computed_frequency(0, [1, 3, -2]) == 2
    end
  end
end
