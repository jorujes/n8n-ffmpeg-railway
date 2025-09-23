ARG N8N_TAG=1.111.1
FROM docker.n8n.io/n8nio/n8n:${N8N_TAG}

USER root
RUN apk add --no-cache ffmpeg

# copia da raiz do repo → para dentro da imagem
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
