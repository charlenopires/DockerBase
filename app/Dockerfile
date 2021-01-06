FROM elixir:1.11.3-slim

WORKDIR /usr/src/app

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
  build-essential \
  curl \
  git \
  gzip \
  inotify-tools \
  ssh \
  sudo \
  tar

RUN apt-get install -y nodejs npm
RUN npm install -g n
RUN n 14.15.4
RUN apt-get purge -y nodejs npm

RUN yes | mix local.hex
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.5.7 --force

RUN apt-get clean

CMD [ "mix", "phx.server" ]