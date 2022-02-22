defmodule Terrible.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)

      timestamps()
    end
  end
end
