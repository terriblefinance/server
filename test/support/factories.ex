defmodule Terrible.Factories do
  @moduledoc """
  Factories for testing via ExMachina.

  Since we are using Event Sourcing, these factories should only be used
  for tests that only touch the Read Store and not the Event Store.

  Specifically, for Query tests since they don't need to touch the Event Store.
  """

  use ExMachina.Ecto, repo: Terrible.Repo

  alias Terrible.Domains.Grouping.Projections.Book

  def book_factory do
    %Book{
      id: UUID.uuid4(),
      name: sequence(:name, &"budget-#{&1}")
    }
  end
end
