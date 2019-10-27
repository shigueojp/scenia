defmodule Scenia.Repo.Migrations.CreateModule do
  use Ecto.Migration

  def change do
    create table(:module) do
      add :serial, :string
      add :username, :string

      timestamps()
    end

  end
end
