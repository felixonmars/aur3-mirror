#!/bin/bash

# GConf
gconftool=$(type -p gconftool-2)
[ -z "$gconftool" ] && echo 2>&1 "gconftool-2 not found" && exit 255
$gconftool -s /desktop/gnome/font_rendering/antialiasing --type=string rgba
$gconftool -s /desktop/gnome/font_rendering/dpi --type=float 96
$gconftool -s /desktop/gnome/font_rendering/hinting --type=string slight
$gconftool -s /desktop/gnome/font_rendering/rgba_order --type=string rgb
$gconftool -s /desktop/gnome/interface/document_font_name --type=string "Verdana 9.599609375"
$gconftool -s /desktop/gnome/interface/font_name  --type=string "Tahoma 9.599609375"
$gconftool -s /desktop/gnome/interface/monospace_font_name --type=string "Monaco 9.599609375"
$gconftool -s /desktop/gnome/interface/icon_theme "ubuntu-mono-light" --type=string
$gconftool -s /desktop/gnome/interface/gtk_theme --type=string 'Radiance'
$gconftool -s /desktop/gnome/interface/gtk_key_theme --type=string 'Emacs'
$gconftool -s /apps/gnomenu/Menu_Name --type=string 'Vista'

bdir=/usr/share/bundle-desktop

# wallpaper
rsync -aP $bdir/wallpaper.png ~/.wallpaper.png
$gconftool -s /desktop/gnome/background/picture_filename --type=string "$HOME/.wallpaper.png" || exit 1
$gconftool -s /desktop/gnome/background/picture_options --type=string "stretched" || exit 1
$gconftool -s /apps/gnome-do/preferences/Do/CorePreferences/Theme --type=string "Glass" || exit 1

# pannel
$gconftool --load $bdir/gconf-panel.xml
rsync -aP "/usr/share/emerald/themes/Ambiance Emerald BW/*" ~/.emerald/theme
mkdir -p ~/.config/compiz/compizconfig
rsync -aP $bdir/fusion-icon ~/.config/compiz
rsync -aP $bdir/compiz.ini ~/.config/compiz/compizconfig/Default.ini
rsync -aP $bdir/*.desktop ~/.config/autostart
ibus-setup 



