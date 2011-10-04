# Maintainer: Valere Monseur <valere dot monseur at ymail dot com>

# Remark: if you encounter "403: Forbidden" from deviantart then modify
# /etc/makepkg.conf and add --user-agent="" in the wget command

pkgname=drakfire-zuki-theme
pkgver=20111004
pkgrel=1
pkgdesc="A gtk2, gtk3 and metacity nice blue theme based on zuki-blues"
arch=('any')
url="http://drakfire86.deviantart.com/art/drakfire-Zuki-GTK3-208493499"
license=('')
depends=('gtk-engine-murrine' 'gtk-engine-equinox' 'gnome-themes-standard' 'gtk3>=3.2.0')
makedepends=('unzip')
source=(http://www.deviantart.com/download/208493499/drakfire_zuki_gtk3_by_drakfire86-d3g4qm3.zip)
md5sums=('e192b8708c77bc8cab76b889e9fabd78')

build() {
  # gtk2, gtk3 and metacity

  install -d "${pkgdir}"/usr/share/themes/drakfire-zuki
  cp -r "${srcdir}"/"Drakfire-Zuki"/* "${pkgdir}"/usr/share/themes/drakfire-zuki/

  # fix for gtk 3.2.0 (not perfect yet)
  sed -i -e 's|url (|url(|' \
  "${pkgdir}"/usr/share/themes/drakfire-zuki/gtk-3.0/gtk-widgets-assets.css

  sed -i -e 's|url (|url(|' \
  "${pkgdir}"/usr/share/themes/drakfire-zuki/gtk-3.0/gtk-widgets-assets-dark.css

  sed -i -e 's|-GtkComboBox-shadow-type: 2|-GtkComboBox-shadow-type: out|' \
  "${pkgdir}"/usr/share/themes/drakfire-zuki/gtk-3.0/gtk-widgets.css

  # fix file, permission and ownership problems

  find "${pkgdir}"/ -name *~ -type f -exec rm -f '{}' \;
  find "${pkgdir}"/ -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/ -type f -exec chmod 644 '{}' \;
  chown -R root.root "${pkgdir}"/*
}
