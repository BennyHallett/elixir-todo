defmodule ExTodo.TodoList do

  def create, do: []

  # Mutation

  def add(todo, item), do: [item|todo] |> Enum.uniq

  def remove(todo, item), do: _remove(todo, item, [])

  defp _remove([], item, output), do: output |> Enum.reverse
  defp _remove([item|tail], item, output), do: _remove(tail, item, output)
  defp _remove([head|tail], item, output), do: _remove(tail, item, [head|output])

  # Persistence

  def save(list, filename), do: File.write(filename, Enum.join(list, "\n"))

  def load(filename), do: filename |> File.read! |> String.split("\n", trim: true)

end
