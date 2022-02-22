defmodule TerribleWeb.BookControllerTest do
  use TerribleWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "GET /books/:id" do
    test "with existing ID returns Book", %{conn: conn} do
      expected_book = insert(:book, %{name: "Test Budget"})

      response =
        conn
        |> get(Routes.book_path(conn, :show, expected_book.id))
        |> json_response(200)

      assert response["data"]["id"] == expected_book.id
      assert response["data"]["name"] == "Test Budget"
      assert response["data"]["created_at"] == DateTime.to_string(expected_book.inserted_at)
    end

    test "with non-existing ID returns 404 error", %{conn: conn} do
      response =
        conn
        |> get(Routes.book_path(conn, :show, UUID.uuid4()))
        |> json_response(404)

      assert response["errors"]["detail"] == "Not Found"
    end
  end

  describe "POST /books" do
    test "with valid data returns Book", %{conn: conn} do
      params = %{name: "Test Book"}

      response =
        conn
        |> post(Routes.book_path(conn, :create), data: params)
        |> json_response(201)

      assert response["data"]["id"]
      assert response["data"]["created_at"]
      assert response["data"]["name"] == "Test Book"
    end

    test "with blank data returns 422 error", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.book_path(conn, :create), data: params)
        |> json_response(422)

      assert response["errors"]["name"] == ["must be present"]
    end
  end
end
