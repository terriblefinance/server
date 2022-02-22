defmodule Terrible.Domains.Grouping.Aggregates.Book do
  @moduledoc false

  defstruct [:uuid, :name]

  @typedoc "Book Aggregate"
  @type t() :: %__MODULE__{
          uuid: Ecto.UUID.t() | nil,
          name: String.t()
        }

  alias __MODULE__
  alias Terrible.Domains.Grouping.Commands.CreateBook
  alias Terrible.Domains.Grouping.Events.BookCreated

  @spec execute(Book.t(), CreateBook.t()) :: BookCreated.t()
  def execute(%Book{uuid: nil}, %CreateBook{} = command) do
    %BookCreated{
      book_uuid: command.book_uuid,
      name: command.name
    }
  end

  @spec apply(Book.t(), BookCreated.t()) :: Book.t()
  def apply(%Book{} = book, %BookCreated{} = event) do
    %Book{
      book
      | uuid: event.book_uuid,
        name: event.name
    }
  end
end
