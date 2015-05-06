defmodule ExTodo.TodoList do

  def create, do: []

  def add(todo, item), do: [item|todo] |> Enum.uniq

end
