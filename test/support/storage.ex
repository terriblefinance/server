defmodule Terrible.Storage do
  @moduledoc """
  Test helpers for using EventStore in testing
  """

  def reset! do
    :ok = Application.stop(:terrible)

    reset_eventstore!()
    reset_readstore!()

    {:ok, _} = Application.ensure_all_started(:terrible)
  end

  defp reset_eventstore! do
    config = Terrible.EventStore.config()

    {:ok, conn} =
      config
      |> EventStore.Config.default_postgrex_opts()
      |> Postgrex.start_link()

    EventStore.Storage.Initializer.reset!(conn, config)
  end

  defp reset_readstore! do
    {:ok, conn} = Postgrex.start_link(Terrible.Repo.config())

    Postgrex.query!(conn, truncate_readstore_tables(), [])
  end

  defp truncate_readstore_tables do
    """
    TRUNCATE TABLE
      books,
      projection_versions
    RESTART IDENTITY
    CASCADE;
    """
  end
end
