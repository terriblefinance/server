defmodule Terrible.CommandedRouter do
  @moduledoc """
  Main router module to be used for Commanded.

  A router module in Commanded is used to route commands
  to their registered command handler and aggregate module.

  See: https://github.com/commanded/commanded/blob/master/guides/Commands.md#command-dispatch-and-routing
  """

  use Commanded.Commands.CompositeRouter
end
