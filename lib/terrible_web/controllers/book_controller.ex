defmodule TerribleWeb.BookController do
  use TerribleWeb, :controller

  alias Terrible.Domains.Grouping.Mutations.Book, as: BookMutation
  alias Terrible.Domains.Grouping.Projections.Book
  alias Terrible.Domains.Grouping.Queries.Book, as: BookQuery

  action_fallback TerribleWeb.FallbackController

  def show(conn, %{"id" => id}) do
    case BookQuery.get(id) do
      %Book{} = book ->
        render(conn, "show.json", book: book)

      _ ->
        {:error, :not_found}
    end
  end

  def create(conn, %{"data" => params}) do
    with {:ok, params} <- params_version(conn, params, "Book"),
         {:ok, %Book{} = book} <- BookMutation.create(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end
end
