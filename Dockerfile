from debian:bullseye-slim

RUN useradd -ms /bin/bash admin

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
    && apt-get install -y -qq --no-install-recommends \
               ca-certificates \
               curl \
    && curl -sLO https://github.com/argoproj/argo-cd/releases/download/v2.4.11/argocd-linux-amd64 \
    && chmod +x argocd-linux-amd64 \
    && mv ./argocd-linux-amd64 /usr/local/bin/argocd \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
