#!/bin/sh

# Chrome options explained:
# --disable-web-security sounds scary, but it just disables the same origin policy restriction that stops us from making "cross site" requests.
# --enable-experimental-web-platform-features enables some CSS features that aren't enabled by default in the current stable branch of chrome at the time of writing this.
# --user-data-dir= creates a new chrome profile at the specified location, starting a new session like this is required for --disable-web-security and keeps it separate from your regular browsing (history, cache, etc).

chromium --enable-experimental-web-platform-features --disable-web-security --user-data-dir="${XDG_CONFIG_DIR:-$HOME/.config}/zenbooru" --app="file:///usr/share/zenbooru/index.html"