defmodule ExTodo.TodoList do

  def create, do: []

  def add(todo, item), do: [item|todo] |> Enum.uniq

  def remove(todo, item), do: _remove(todo, item, [])

  defp _remove([], item, output), do: output |> Enum.reverse
  defp _remove([item|tail], item, output), do: _remove(tail, item, output)
  defp _remove([head|tail], item, output), do: _remove(tail, item, [head|output])

end
