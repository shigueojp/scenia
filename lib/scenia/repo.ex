defmodule Scenia.Repo do
  use Ecto.Repo,
    otp_app: :scenia,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, "postgres://postgres:Sceniaproject@database-scenia.cvk4xzosz1ng.us-east-1.rds.amazonaws.com:5432/sceniaproject")}#System.get_env("SCENIA_DATABASE"))}
  end
end
