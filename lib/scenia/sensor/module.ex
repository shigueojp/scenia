defmodule Scenia.Sensor.Module do
  use Ecto.Schema
  import Ecto.Changeset

  schema "module" do
    field :serial, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(module, attrs) do
    module
    |> cast(attrs, [:serial, :username])
    |> validate_required([:serial, :username])
  end
end
