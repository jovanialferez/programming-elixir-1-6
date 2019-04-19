defmodule Awesome do
    def anagram?(word1, word2) when word1 == word2, do: true
    @doc """
    Simple algo for anagram: sort then compare.
    """
    def anagram?(word1, word2) do
        sorted1 = word1 |> trimAndSort
        sorted2 = word2 |> trimAndSort

        sorted1 == sorted2
    end

    @doc """
    Trims any spaces (?\s) then sort.
    """
    defp trimAndSort(word) do
        word 
            |> Enum.filter(&(&1 != ?\s))
            |> Enum.sort
    end
end