#!/bin/bash

while true; do
  POSITION=$(curl -s http://localhost:3000/api/v1/getState | jq -r '.position')

  # Verifica se POSITION é um número inteiro
  if [[ "$POSITION" =~ ^[0-9]+$ ]]; then
    echo "Volumio está pronto! Posição da faixa atual: $POSITION"
    break
  else
    echo "Ainda não pronto, esperando..."
  fi

  sleep 1
done

