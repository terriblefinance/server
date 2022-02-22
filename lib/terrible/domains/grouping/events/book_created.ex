defmodule Terrible.Domains.Grouping.Events.BookCreated do
  @moduledoc false

  @derive Jason.Encoder
  defstruct [:book_uuid, :name]

  @typedoc "Event for CreateBook command"
  @type t() :: %__MODULE__{
          book_uuid: Ecto.UUID.t(),
          name: String.t()
        }
end
