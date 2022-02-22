defmodule Terrible.Domains.Grouping.Mutations.BookTest do
  use Terrible.DataCase

  alias Terrible.Domains.Grouping.Mutations.Book, as: BookMutation

  describe "create/1" do
    test "with valid data creates new Book record" do
      attrs = %{
        name: "Test Budget"
      }

      {:ok, book} = BookMutation.create(attrs)

      assert book.id
      assert book.name == "Test Budget"
    end

    test "with blank data returns error" do
      {:error, :validation_failure, errors} = BookMutation.create()

      assert errors[:name] == ["must be present"]
    end
  end
end
