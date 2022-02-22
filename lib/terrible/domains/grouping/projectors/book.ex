defmodule Terrible.Domains.Grouping.Projectors.Book do
  @moduledoc """
  Projector module for the Book aggregate.
  """

  use Commanded.Projections.Ecto,
    application: Terrible.Commanded,
    name: __MODULE__,
    consistency: :strong

  alias Ecto.Multi
  alias Terrible.Domains.Grouping.Events.BookCreated
  alias Terrible.Domains.Grouping.Projections.Book

  project(%BookCreated{} = event, fn multi ->
    Multi.insert(multi, :book, %Book{
      id: event.book_uuid,
      name: event.name
    })
  end)
end
