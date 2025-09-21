ARG N8N_TAG=1.111.1
FROM docker.n8n.io/n8nio/n8n:${N8N_TAG}
USER root
RUN apk add --no-cache ffmpeg
USER node
