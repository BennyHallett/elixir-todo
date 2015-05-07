defmodule PersistenceTest do
  use ExUnit.Case

  @filename '/tmp/todolist'

  setup do
    on_exit fn -> @filename |> File.rm end
  end

  test "save a todo list" do
    list = ExTodo.TodoList.create
    |> ExTodo.TodoList.add("first")
    |> ExTodo.TodoList.add("second")
    |> ExTodo.TodoList.add("third")
    |> ExTodo.TodoList.save(@filename)

    contents = File.read!(@filename)

    assert "third\nsecond\nfirst" == contents
  end

  test "load a todo list" do
    File.write(@filename, "third\nsecond\nfirst")

    list = ExTodo.TodoList.load(@filename)

    assert ["third", "second", "first"] == list
  end

end
