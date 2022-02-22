defmodule Terrible.Domains.Grouping.Events.BookCreatedTest do
  use ExUnit.Case
  import Commanded.Assertions.EventAssertions

  alias Terrible.Commanded
  alias Terrible.Domains.Grouping.Commands.CreateBook
  alias Terrible.Domains.Grouping.Events.BookCreated

  describe "CreateBook command" do
    test "publishes BookCreated event" do
      book_uuid = UUID.uuid4()
      book_name = "Test Budget for BookCreated event"

      :ok = Commanded.dispatch(%CreateBook{book_uuid: book_uuid, name: book_name})

      assert_receive_event(
        Commanded,
        BookCreated,
        fn event -> event.book_uuid == book_uuid end,
        fn event ->
          assert event.name == book_name
        end
      )
    end
  end
end
