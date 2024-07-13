#!/bin/bash
note() {
    NOTES_DIR="$HOME/notes/d"
    CURRENT_DATE=$(date +'%d-%m-%Y')
    FILE_PATH="$NOTES_DIR/$CURRENT_DATE.md"
    mkdir -p "$NOTES_DIR"
    if [ ! -f "$FILE_PATH" ]; then
        touch "$FILE_PATH"
    fi
    $EDITOR "$FILE_PATH"
}
