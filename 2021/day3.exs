defmodule Solution do
  def run(strs) do
    exp = String.length(List.first(strs))
    total = length(strs)
    temp = strs
     |> Enum.map(fn str ->
        str |> String.graphemes
          |> Enum.map(fn c -> String.to_integer(c) end)
          |> Stream.with_index(1)
          |> Enum.map(fn {k, v}->{v, k} end)
          |> Map.new
        end
      )
     |> Enum.reduce(fn a, b -> 
          Map.merge(a, b, fn _k, x, y -> x + y end)
        end
       )
    bin = Map.to_list(temp)
      |> Enum.sort
      |> Enum.map(fn {_k, v}-> if v > total / 2, do: 1, else: 0 end)
      |> Enum.join
    final = String.to_integer(bin, 2)
    another = :math.pow(2, exp) - 1 - final |> round
    IO.puts(another * final)
  end
end


input =
  IO.read(:stdio, :all)
  |> String.split("\n")

Solution.run(input)