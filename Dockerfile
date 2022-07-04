FROM elixir:latest

WORKDIR "/usr/src/<projectname>"

RUN apt-get update \
&& apt-get install -y nodejs npm inotify-tools \
&& npm install -g n \
&& n 16.15.1 \
&& apt-get purge -y nodejs npm \
&& apt-get install -y postgresql-client \
&& yes | mix local.hex \
&& mix local.rebar --force \
&& mix archive.install hex phx_new --force \
&& apt-get clean

CMD ["mix", "phx.server"]
