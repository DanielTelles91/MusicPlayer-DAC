#!/bin/bash

# Consulta a informação da faixa atual
CURRENT_DATA=$(curl -s http://localhost:3000/api/v1/getState)

# Tenta extrair a posição atual
CURRENT_POSITION=$(echo "$CURRENT_DATA" | jq '.position')

# Verifica se conseguiu pegar a posição
if [[ "$CURRENT_POSITION" =~ ^[0-9]+$ ]]; then
    echo "$CURRENT_POSITION" > /home/volumio/last_track_position.txt
    echo "Faixa atual: posição $CURRENT_POSITION"
else
    echo "Erro: não foi possível determinar a posição atual."
    echo "$CURRENT_DATA"
fi

