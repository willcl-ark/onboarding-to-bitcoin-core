FROM ruby:3.2.2-bookworm

RUN apt update && \
    apt --yes upgrade && \
    apt --yes install build-essential curl procps git nodejs npm --no-install-recommends

WORKDIR /srv/
COPY Gemfile /srv/Gemfile

RUN bundle install
RUN npm install -g @mermaid-js/mermaid-cli

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENTRYPOINT ["bash", "-l"]
