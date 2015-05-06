defmodule ExTodoTest do
  use ExUnit.Case

  test "create a new todo list" do
    assert [] == ExTodo.TodoList.create
  end

  test "add items to the list" do
    list = ExTodo.TodoList.create

    one = ExTodo.TodoList.add(list, "ONE")
    two = ExTodo.TodoList.add(one, "TWO")

    assert ["ONE"] == one
    assert ["TWO", "ONE"] == two
  end

  test "add one item to the list twice" do
    list = ExTodo.TodoList.create
    |> ExTodo.TodoList.add("Same")
    |> ExTodo.TodoList.add("Same")

    assert ["Same"] == list
  end

end
