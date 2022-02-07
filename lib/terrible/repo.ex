defmodule Terrible.Repo do
  use Ecto.Repo,
    otp_app: :terrible,
    adapter: Ecto.Adapters.Postgres
end
