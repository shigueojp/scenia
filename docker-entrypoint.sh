#!/bin/bash
set -e

#uncomment this if you use ecto
#mix do ecto.create, ecto.migrate

#elixir -pa _build/prod/consilidated -S mix phx.server
sh -c "mix deps.get && mix ecto.setup && mix phx.server"

exec $@
