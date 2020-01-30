defmodule ChronalCalibration do
  @moduledoc """
  Documentation for ChronalCalibration.
  """

  @doc """
  Receives the initial frequency and a binary as representing the relative path
  to a document containing the frequency variations. It returns the final frequency
  after all the variations have been computed.
  """

  def computed_frequency(initial_frequency, frequency_variations_file_path)
      when is_binary(frequency_variations_file_path) do
    computed_frequency(
      initial_frequency,
      extracted_frequency_variations(frequency_variations_file_path)
    )
  end

  def computed_frequency(initial_frequency, frequency_variations)
      when is_list(frequency_variations) do
    initial_frequency + Enum.sum(frequency_variations)
  end

  @doc """
  Takes the initial_frequency and a binary representing the file path to
  frequency variations and runs infintely untill it finds a frequency repeated twice.
  The function assumes that it will reach a repeated frequency. Otherwise that would
  be an infinite loop..
  """

  def first_frequency_repeated(initial_frequency, frequency_variations_file_path) do
    initial_frequencies_history = MapSet.new([initial_frequency])
    frequency_variations = extracted_frequency_variations(frequency_variations_file_path)

    recursively_look_for_repeated_frequency(
      initial_frequency,
      frequency_variations,
      initial_frequencies_history
    )
  end

  def recursively_look_for_repeated_frequency(
        initial_frequency,
        frequency_variations,
        initial_frequencies_history
      ) do
    case check_next_frequecy(initial_frequency, frequency_variations, initial_frequencies_history) do
      {:ok, repeated_frequency} ->
        repeated_frequency

      {:error, last_frequency, frequencies_history} ->
        recursively_look_for_repeated_frequency(
          last_frequency,
          frequency_variations,
          frequencies_history
        )
    end
  end

  def check_next_frequecy(last_frequency, [], frequencies_history) do
    {:error, last_frequency, frequencies_history}
  end

  def check_next_frequecy(
        current_frequency,
        [next_frequency_variation | rest_of_frequency_variations],
        frequencies_history
      ) do
    next_frequency = current_frequency + next_frequency_variation

    if MapSet.member?(frequencies_history, next_frequency) do
      {:ok, next_frequency}
    else
      new_frequencies_history = MapSet.put(frequencies_history, next_frequency)
      check_next_frequecy(next_frequency, rest_of_frequency_variations, new_frequencies_history)
    end
  end

  defp extracted_frequency_variations(source_file_path) do
    {:ok, file_content} = File.read(source_file_path)

    file_content
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn string -> String.to_integer(string) end)
  end
end
