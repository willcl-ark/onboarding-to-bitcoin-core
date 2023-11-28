FROM ruby:3.2.2-bookworm

RUN apt update && \
    apt --yes upgrade && \
    apt --yes install build-essential curl procps git nodejs npm --no-install-recommends

RUN apt update && \
    apt --yes install ca-certificates fonts-liberation libappindicator3-1 libasound2 \
        libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 \
        libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 \
        libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
        libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
        lsb-release wget xdg-utils --no-install-recommends
# RUN apt --yes install chromium

ARG UID=1000
ARG GID=1000

WORKDIR /srv/
COPY entrypoint.sh .
COPY Gemfile /srv/Gemfile

RUN groupadd -g ${GID} docs && \
    useradd -m -u ${UID} -g docs -s /bin/bash docs
RUN chown -R docs:docs /srv/
USER docs

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENTRYPOINT ["/srv/entrypoint.sh"]
