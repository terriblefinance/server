defmodule Terrible.Domains.Grouping.Mutations.Book do
  @moduledoc """
  Mutation module for executing commands relating to Book aggregate
  """

  alias Terrible.Commanded
  alias Terrible.Domains.Grouping.Commands.CreateBook
  alias Terrible.Domains.Grouping.Projections.Book
  alias Terrible.Domains.Grouping.Queries.Book, as: BookQuery

  @doc """
  Creates a Book projection based on the given map.

  ## Examples

    iex> create(map)
    {:ok, %Book{}}

    iex> create(map)
    {:error, :something_bad_happened}

  """
  @spec create(map()) :: {:ok, Book.t()} | {:error, any}
  def create(attrs \\ %{}) do
    book_uuid = UUID.uuid4()

    command =
      attrs
      |> CreateBook.new()
      |> CreateBook.assign_uuid(book_uuid)

    case Commanded.dispatch(command, consistency: :strong) do
      :ok ->
        {:ok, BookQuery.get(book_uuid)}

      error ->
        error
    end
  end
end
