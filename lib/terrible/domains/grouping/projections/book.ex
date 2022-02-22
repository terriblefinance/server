defmodule Terrible.Domains.Grouping.Projections.Book do
  @moduledoc """
  Books are the top-most level models when it comes to budgeting.

  Basically, what you see in the budgeting page is what we define as Book.

  We store the BookCreated event in this projection.
  """

  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "books" do
    field(:name, :string)

    timestamps()
  end

  @typedoc "Projection of a Book object"
  @type t :: %__MODULE__{
          uuid: Ecto.UUID.t(),
          name: String.t(),
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }
end
