ARG N8N_TAG=1.111.1
FROM docker.n8n.io/n8nio/n8n:${N8N_TAG}

# Precisamos ser root para instalar e para ajustar permissões do volume em runtime
USER root
RUN apk add --no-cache ffmpeg

# Cria entrypoint que acerta perms do volume antes do n8n subir
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Rode o entrypoint como root; dentro dele podemos baixar privilégio se quiser
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
