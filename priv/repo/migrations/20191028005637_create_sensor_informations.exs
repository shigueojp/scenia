defmodule Scenia.Repo.Migrations.CreateSensorInformations do
  use Ecto.Migration

  def change do
    create table(:sensor_informations) do
      add :A1, :float
      add :A2, :float
      add :A3, :float
      add :freq1, :float
      add :freq2, :float
      add :freq3, :float
      add :Irms, :float
      add :Vrms, :float
      add :module_serial, references(:module, on_delete: :nothing)

      timestamps()
    end

    create index(:sensor_informations, [:module_serial])
  end
end
