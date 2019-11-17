#FROM elixir:1.9.4-alpine
#
#ENV MIX_ENV prod
#ENV PORT 4002
#EXPOSE 4002
#
#RUN mkdir /app
#ADD . /app
#
#WORKDIR /app
#
#RUN mix local.hex --force
#RUN mix local.rebar --force
#RUN mix deps.get
#RUN mix compile
#RUN mix phx.digest
#
#COPY ./docker-entrypoint.sh /
#RUN chmod +x /docker-entrypoint.sh
#
#ENTRYPOINT ["/docker-entrypoint.sh"]
#

FROM elixir:1.9.4-alpine

ARG MIX_ENV=dev
ENV MIX_ENV=${MIX_ENV}

WORKDIR /srv/app

COPY . .

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile

CMD ["mix", "deps.get"]
CMD ["mix", "ecto.setup"]
CMD ["mix", "phx.server"]

EXPOSE 4000

