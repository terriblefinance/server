defmodule Terrible.Domains.Grouping.Queries.Book do
  @moduledoc """
  Query module for retrieving Book Aggregate projections
  """

  alias Terrible.Domains.Grouping.Projections.Book
  alias Terrible.Repo

  @doc """
  Returns a Book projection based on the given ID.

  ## Examples

    iex> get(existing_id)
    %Book{}

    iex> get(non_existing_id)
    nil

  """
  @spec get(Ecto.UUID.t()) :: Book.t() | nil
  def get(id) do
    Repo.get(Book, id)
  end
end
