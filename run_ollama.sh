#!/bin/bash

# Setze Variablen
NETWORK_NAME="ollama_network"
OLLAMA_CONTAINER="ollama"
WEBUI_CONTAINER="open-webui"
OLLAMA_IMAGE="ollama/ollama:latest"
WEBUI_IMAGE="ghcr.io/open-webui/open-webui:main"
OLLAMA_PORT=11434
WEBUI_PORT=3000

# Erstelle ein gemeinsames Docker-Netzwerk, falls es nicht existiert
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || \
    docker network create $NETWORK_NAME

# Starte den Ollama-Container
docker run -d \
    --name $OLLAMA_CONTAINER \
    --network $NETWORK_NAME \
    -p $OLLAMA_PORT:$OLLAMA_PORT \
    $OLLAMA_IMAGE

# Starte den Open WebUI-Container
docker run -d \
    --name $WEBUI_CONTAINER \
    --network $NETWORK_NAME \
    -p $WEBUI_PORT:$WEBUI_PORT \
    -e OLLAMA_BASE_URL=http://$OLLAMA_CONTAINER:$OLLAMA_PORT \
    $WEBUI_IMAGE

echo "Ollama läuft auf Port $OLLAMA_PORT"
echo "Open WebUI läuft auf Port $WEBUI_PORT"
echo "Open WebUI greift auf Ollama unter http://$OLLAMA_CONTAINER:$OLLAMA_PORT zu"
