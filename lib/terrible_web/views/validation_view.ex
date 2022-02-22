defmodule TerribleWeb.ValidationView do
  use TerribleWeb, :view

  def render("error.json", %{errors: errors}) do
    %{errors: errors}
  end
end
