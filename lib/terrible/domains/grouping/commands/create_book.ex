defmodule Terrible.Domains.Grouping.Commands.CreateBook do
  @moduledoc """
  Command to create a Book record.

  Books are the top-level model where all budgeting-related models will be associated with.
  """

  defstruct [:book_uuid, :name]

  @typedoc "Command to create a Book record"
  @type t() :: %__MODULE__{
          book_uuid: Ecto.UUID.t(),
          name: String.t()
        }

  use ExConstructor
  use Vex.Struct

  alias __MODULE__

  validates(:book_uuid, uuid: true)
  validates(:name, presence: true)

  @doc ~S"""
  Assign a unique ID for the Book.

  ## Examples

    iex> assign_uuid(%Terrible.Domains.Grouping.Commands.CreateBook{}, "3d4162dc-b1f9-418b-bc47-3463491b15de")
    %Terrible.Domains.Grouping.Commands.CreateBook{book_uuid: "3d4162dc-b1f9-418b-bc47-3463491b15de"}

  """
  @spec assign_uuid(CreateBook.t(), Ecto.UUID.t()) :: CreateBook.t()
  def assign_uuid(%CreateBook{} = command, uuid) do
    %CreateBook{command | book_uuid: uuid}
  end
end
