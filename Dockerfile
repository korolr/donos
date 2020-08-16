FROM elixir:1.10

COPY . /srv/www/src
WORKDIR /srv/www/src

RUN mix local.hex --force
RUN mix deps.get
RUN mix local.rebar --force
RUN mix release
RUN _build/dev/rel/donos/bin/donos start
