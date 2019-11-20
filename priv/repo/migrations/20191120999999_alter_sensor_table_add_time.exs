defmodule Scenia.Repo.Migrations.CreateSensorInformations do
  use Ecto.Migration

  def change do
    alter table(:sensor_informations) do
      add :send_at, :utc_datetime
    end
  end
end
