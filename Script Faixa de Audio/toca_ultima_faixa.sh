#!/bin/bash

VOL_URL="http://volumio.local:3000"
ARQUIVO="last_track_position.txt"

# Esperar até que Volumio esteja pronto
while ! ./volumio_esta_pronto.sh; do
  echo "Ainda não pronto, esperando..."
  sleep 1
done

echo "Volumio está pronto!"

if [[ ! -f "$ARQUIVO" ]]; then
  echo "Arquivo $ARQUIVO não encontrado!"
  exit 1
fi

FAIXA=$(head -n 1 "$ARQUIVO" | tr -d ' \r\n')

echo "Volumio está pronto! Posição da faixa atual: $FAIXA"
echo "Aguardando alguns segundos para o player inicializar..."
sleep 4

echo "Tocando faixa número $FAIXA"
curl -s "${VOL_URL}/api/v1/commands/?cmd=play&N=${FAIXA}"

exit 0

