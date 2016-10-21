FROM gsol/node:6.9.1
MAINTAINER Global Solutions co., ltd.
LABEL version="0.1.0"

WORKDIR "/home/node/verdaccio"
ADD package.json config.yaml /home/node/verdaccio/

RUN adduser --disabled-password --gecos '' node && \
    npm install --production && \
    chown node:node . -R

USER node
VOLUME ["/home/node/verdaccio/storage", "/home/node/verdaccio/local_storage"]
EXPOSE 4873

ENTRYPOINT ["npm"]
CMD ["start", "--", "--config", "/home/node/verdaccio/config.yaml"]
