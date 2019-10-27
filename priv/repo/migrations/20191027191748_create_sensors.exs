defmodule Scenia.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors_information) do
      add :A1, :float
      add :A2, :float
      add :A3, :float
      add :freq1, :float
      add :freq2, :float
      add :freq3, :float
      add :Irms, :float
      add :Vrms, :float
      add :module_id, references(:module, on_delete: :nothing)

      timestamps()
    end

    create index(:sensors_information, [:module_id])
  end
end
