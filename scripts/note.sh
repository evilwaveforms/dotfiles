#!/bin/bash
note() {
    NOTES_DIR="$HOME/notes"
    CURRENT_DATE=$(date +'%d-%m-%Y')
    if [ $# -eq 0 ]; then
        FILE_PATH="$NOTES_DIR/d/$CURRENT_DATE.md"
    else
        NOTE_NAME="$1"
        FILE_PATH="$NOTES_DIR/${NOTE_NAME}.md"
    fi
    mkdir -p "$NOTES_DIR/d"
    if [ ! -f "$FILE_PATH" ]; then
        touch "$FILE_PATH"
    fi
    $EDITOR "$FILE_PATH"
}
