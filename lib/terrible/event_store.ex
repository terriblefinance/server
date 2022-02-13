defmodule Terrible.EventStore do
  @moduledoc """
  Main module to use the EventStore library

  An event store is a type of database optimized for storage
  of events. It is typically used in event sourcing.

  See:
    - https://github.com/commanded/eventstore
    - https://martinfowler.com/eaaDev/EventSourcing.html
  """

  use EventStore, otp_app: :terrible

  def init(config) do
    {:ok, config}
  end
end
