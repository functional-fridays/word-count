defmodule Word do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    lowercase_sentence = String.downcase(sentence)
    Regex.split(~r/(?![-äöüÄÖÜß])\W+|_/,lowercase_sentence, trim: true)
    |> Enum.reduce(%{},fn(item, acc) ->
      add_map(acc, item, acc[item])
    end)
  end
  
  def add_map(acc, item, nil) do
    Map.put(acc, item, 1)
  end

  def add_map(acc, item, value) do
    Map.put(acc, item, value + 1)
  end
end
