defmodule ChronalCalibration do
  @moduledoc """
  Documentation for ChronalCalibration.
  """

  @doc """
  Receives the initial frequency and an optional list of frequency
  variations and returns the computed frequency.
  Alternatively the function can receive a binary as the second argument
  representing the relative path to a document containing the frequency variations.

  ## Examples

      iex> ChronalCalibration.computed_frequency(1)
      1

      iex> ChronalCalibration.computed_frequency(1, [2, 3])
      6

  """
  def computed_frequency(initial_frequency, frequency_variations \\ [])

  def computed_frequency(initial_frequency, frequency_variations)
      when is_list(frequency_variations) do
    initial_frequency + Enum.sum(frequency_variations)
  end

  def computed_frequency(initial_frequency, frequency_variations_file_path)
      when is_binary(frequency_variations_file_path) do
    computed_frequency(
      initial_frequency,
      extracted_frequency_variations(frequency_variations_file_path)
    )
  end

  defp extracted_frequency_variations(source_file_path) do
    {:ok, file_content} = File.read(source_file_path)

    file_content
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn string -> String.to_integer(string) end)
  end
end
