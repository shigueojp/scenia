defmodule Scenia.Repo.Migrations.CreateSensorInformations do
  use Ecto.Migration

  def change do
    create table(:sensor_informations) do
      add :value, :float

      timestamps()
    end
  end
end
