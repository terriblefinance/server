defmodule Terrible.Domains.Grouping.Queries.BookTest do
  use Terrible.DataCase

  alias Terrible.Domains.Grouping.Queries.Book, as: BookQuery

  describe "get/1" do
    test "with existing ID returns Book projection" do
      expected_book = insert(:book, %{name: "Test Budget"})

      book = BookQuery.get(expected_book.uuid)

      assert book.uuid == expected_book.uuid
      assert book.name == "Test Budget"
    end

    test "with non-existing ID returns nil" do
      assert BookQuery.get(UUID.uuid4()) == nil
    end
  end
end
