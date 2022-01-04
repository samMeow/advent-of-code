defmodule Solution do
  def run(strs) do
    exp = String.length(List.first(strs))
    oxy = 1..exp
      |> Enum.reduce(
        {"", strs},
        fn _x, {p, g} -> 
          len = String.length(p)
          size = length(g)
          if size == 1 do
            { List.first(g), g}
          else
            sig = g
              |> Enum.reduce(0, fn v, acc-> acc + (v |> String.at(len) |> String.to_integer) end)
            result = if sig >= size / 2, do: "1", else: "0"
            newp = p <> result
            { newp, g |> Enum.filter(fn v -> String.starts_with?(v, newp) end)}
          end
        end)
    co = 1..exp
      |> Enum.reduce(
        {"", strs},
        fn _x, {p, g} -> 
          len = String.length(p)
          size = length(g)
          if size == 1 do
            { List.first(g), g}
          else
            sig = g
              |> Enum.reduce(0, fn v, acc-> acc + (v |> String.at(len) |> String.to_integer) end)
            result = if sig < size / 2, do: "1", else: "0"
            newp = p <> result
            { newp, g |> Enum.filter(fn v -> String.starts_with?(v, newp) end)}
          end
        end)
    oxy_num = String.to_integer(elem(oxy, 0), 2)
    co_num = String.to_integer(elem(co, 0), 2)
    IO.puts(oxy_num * co_num)
  end
end


input =
  IO.read(:stdio, :all)
  |> String.split("\n")

Solution.run(input)