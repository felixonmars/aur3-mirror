at now <<EOF
    /usr/lib/vdr/svdrpsend.pl GRAB - | \
      sed -n -e 's/^216-//p' -e '1ibegin-base64 644 -' -e '\$a====' | \
      uudecode | \
      convert -crop 720x576+6+5 -resize 720x576 - png:- | \
      composite -compose src-over /usr/share/vdr-plugin-burn/template.png - \
      /var/lib/vdr/plugins/burn/skins/Grabbed/menu-bg.png
EOF
