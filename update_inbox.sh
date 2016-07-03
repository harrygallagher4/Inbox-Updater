#!/bin/sh
WIDTH=1000
HEIGHT=700
INBOX_PATH="/Applications/Inbox.app"
INBOX_SRC="Inbox-darwin-x64"

function update_inbox {
    [ -e $(which nativefier) ] && \
    nativefier \
    'https://inbox.google.com/' \
    --name 'Inbox' \
    --icon './inbox.icns' \
    --overwrite \
    -m \
    --width $WIDTH \
    --height $HEIGHT && \
    if [ -d $INBOX_PATH ]
    then
        echo "Removing existing app..."
        rm -rf $INBOX_PATH && echo "Removed."
    fi && \
    mv "$INBOX_SRC/Inbox.app" $INBOX_PATH && \
    echo "Installed." && \
    rm -rf $INBOX_SRC
}

update_inbox
