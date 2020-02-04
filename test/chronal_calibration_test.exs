defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  describe "compute_frequency/2" do
    test "adds the sum of the variations taken from a file to the inital frequency when the file's path is passed in" do
      assert ChronalCalibration.computed_frequency(0, "./test/data/sample.data") == 3
    end
  end

  describe "first_frequency_repeated/2" do
    test "returns the first computed_frequency repeated twice if a frequency is repeated" do
      assert ChronalCalibration.first_frequency_repeated(0, "./test/data/sample.data") == 3
    end

    test "loops data variations untill a frequency is found" do
      assert ChronalCalibration.first_frequency_repeated(0, "./test/data/sample_requiring_second_loop.data") == 0
    end
  end
end
