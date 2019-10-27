defmodule Scenia.Repo do
  use Ecto.Repo,
    otp_app: :scenia,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, "postgres://postgres:postgres@localhost:5434/scenia")}#System.get_env("SCENIA_DATABASE"))}
  end
end
