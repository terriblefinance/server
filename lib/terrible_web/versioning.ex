defmodule TerribleWeb.Versioning do
  @moduledoc """
  API version schema for Terrible.

  Newly-created endpoints don't need to be added here. Only
  changes to existing endpoints.

  Versions are read from top to bottom so newer versions
  must be placed at the top.

  We are using the Versioning library to implement
  API versioning in this app the way Stripe does it.

  See:
    - https://github.com/nsweeting/versioning
    - https://stripe.com/blog/api-versioning
  """

  use Versioning.Schema, adapter: Versioning.Adapter.Date

  version("2022-02-22", do: [])
end
