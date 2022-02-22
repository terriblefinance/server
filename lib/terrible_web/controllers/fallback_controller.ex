defmodule TerribleWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use TerribleWeb, :controller

  def call(conn, {:error, :validation_failure, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(TerribleWeb.ValidationView)
    |> render("error.json", errors: errors)
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(TerribleWeb.ErrorView)
    |> render(:"404")
  end
end
