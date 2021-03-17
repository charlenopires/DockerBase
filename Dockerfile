FROM elixir:1.11

WORKDIR "/usr/src/<projectname>"

RUN apt-get update \
&& apt-get install -y nodejs npm inotify-tools \
&& npm install -g n \
&& n 14.16.0 \
&& apt-get purge -y nodejs npm \
&& apt-get install -y postgresql-client \
&& yes | mix local.hex \
&& mix local.rebar --force \
&& mix archive.install hex phx_new 1.5.8 --force \
&& apt-get clean

CMD ["mix", "phx.server"]
