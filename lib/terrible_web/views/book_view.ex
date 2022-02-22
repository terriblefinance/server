defmodule TerribleWeb.BookView do
  use TerribleWeb, :view
  alias __MODULE__

  def render("show.json", %{conn: conn, book: book}) do
    %{data: render_version(conn, book, "Book", BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name,
      created_at: DateTime.to_string(book.inserted_at)
    }
  end
end
