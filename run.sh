#!/bin/bash

echo "Fetching latest changes..."
git fetch origin
git reset --hard origin/main  # or replace 'main' with your branch name

echo "Updating complete. Starting game..."
./start_game_bepinex.sh
