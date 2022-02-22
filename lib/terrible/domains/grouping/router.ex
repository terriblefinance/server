defmodule Terrible.Domains.Grouping.Router do
  @moduledoc false

  use Commanded.Commands.Router

  alias Terrible.Domains.Grouping.Aggregates.Book
  alias Terrible.Domains.Grouping.Commands.CreateBook

  middleware(Terrible.Middleware.Validate)

  identify(Book, by: :book_uuid, prefix: "book-")

  dispatch([CreateBook], to: Book)
end
