defmodule Word do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/(?![-])\W+|_/u, trim: true)
    |> Enum.frequencies
  end
end
