FROM elixir:1.9.4-alpine

ARG MIX_ENV=prod
ENV MIX_ENV=${MIX_ENV}

WORKDIR /srv/app

COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile
