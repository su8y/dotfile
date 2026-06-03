FROM node:20-slim

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*
RUN npm install -g @anthropic-ai/claude-code

RUN useradd -m -s /bin/bash su8y

USER su8y
WORKDIR /home/su8y/work

ENTRYPOINT ["claude"]
