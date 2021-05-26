FROM elixir:1.12

WORKDIR "/usr/src/<projectname>"

RUN apt-get update \
&& apt-get install -y nodejs npm inotify-tools \
&& npm install -g n \
&& n 14.17.0 \
&& apt-get purge -y nodejs npm \
&& apt-get install -y postgresql-client \
&& yes | mix local.hex \
&& mix local.rebar --force \
&& mix archive.install hex phx_new 1.5.9 --force \
&& apt-get clean

CMD ["mix", "phx.server"]
