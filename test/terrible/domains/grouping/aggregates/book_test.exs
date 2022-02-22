defmodule Terrible.Domains.Grouping.Aggregates.BookTest do
  use ExUnit.Case
  import Commanded.Assertions.EventAssertions

  alias Commanded.Aggregates.Aggregate
  alias Terrible.Commanded
  alias Terrible.Domains.Grouping.Aggregates.Book
  alias Terrible.Domains.Grouping.Commands.CreateBook
  alias Terrible.Domains.Grouping.Events.BookCreated

  describe "CreateBook command" do
    test "with valid data produces the correct Book state" do
      book_uuid = UUID.uuid4()
      book_name = "Test Budget"

      :ok = Commanded.dispatch(%CreateBook{book_uuid: book_uuid, name: book_name})

      wait_for_event(Commanded, BookCreated, fn event ->
        event.book_uuid == book_uuid
      end)

      assert Aggregate.aggregate_state(Commanded, Book, "book-" <> book_uuid) == %Book{
               uuid: book_uuid,
               name: book_name
             }
    end
  end
end
