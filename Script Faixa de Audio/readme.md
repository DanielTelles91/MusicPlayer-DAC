Volumio has a limitation where it does not remember the last track played after cold boot. Because of this, I created a few scripts with the following purposes:

1º **volumio_esta_pronto.sh:** Ensures that the Volumio system is fully loaded.

2º **toca_ultima_faixa.sh:** After Volumio is fully loaded, this script reads the last_track_position.txt file to determine the last track that was played and sets playback to that track.

3º **salva_faixa_atual.sh:** This script runs periodically to save the currently playing track to the last_track_position.txt file.
