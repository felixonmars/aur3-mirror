#!/bin/bash

post_install()
{
echo "Updating font cache..."
fc-cache -f >/dev/null
mkfontscale usr/share/fonts/TTF/coolfonts
mkfontdir usr/share/fonts/TTF/coolfonts
}

post_upgrade()
{
post_install $1
}

post_remove()
{
post_install $1
}
