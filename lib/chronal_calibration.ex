defmodule ChronalCalibration do
  @moduledoc """
  Documentation for ChronalCalibration.
  """

  @doc """
  Receives the initial frequency and an optional list of frequency
  variations and returns the computed frequency.

  ## Examples

      iex> ChronalCalibration.computed_frequency(1)
      1

      iex> ChronalCalibration.computed_frequency(1, [2, 3])
      6

  """
  def computed_frequency(initial_frequency, frequency_variations \\ []) do
    initial_frequency + Enum.sum(frequency_variations)
  end
end
