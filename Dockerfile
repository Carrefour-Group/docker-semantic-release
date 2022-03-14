FROM node:17.7.1-buster-slim

ENV PATH="$PATH:/app/node_modules/.bin"

RUN apt-get update && \
  apt-get install -y curl git git-lfs openssh-client && \
  rm -rf /var/lib/apt/lists/*

COPY ./package.json ./package-lock.json /app/

RUN cd /app && \
  npm ci

CMD [ "semantic-release" ]
