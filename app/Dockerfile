FROM elixir:1.11

WORKDIR /usr/src/app

RUN apt-get update \
&& apt-get install -y nodejs npm \
&& npm install -g n \
&& n 14.15.4 \
&& apt-get purge -y nodejs npm \
&& yes | mix local.hex \
&& mix local.rebar --force \
&& mix archive.install hex phx_new 1.5.7 --force \
&& apt-get clean

CMD [ "mix", "phx.server" ]
