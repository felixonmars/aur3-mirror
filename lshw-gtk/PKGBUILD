# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Can Celasun <dcelasun at gmail dot com>

pkgname=lshw-gtk
pkgver=B.02.16
pkgrel=2
pkgdesc="Hardware lister application with CLI and GTK interfaces."
url="http://ezix.org/project/wiki/HardwareLiSter"
license="GPL"
arch=(i686 x86_64)
depends=('gtk2' 'libglade' 'gksu')
provides=('lshw')
conflicts=('lshw')
source=(http://ezix.org/software/files/lshw-${pkgver}.tar.gz
                lshw-gtk.desktop
                lshw-gtk.xpm)
md5sums=('67479167add605e8f001097c30e96d0d'
         'f7e7551c68598782c5251475dea47130'
         '5ea8cd43ff46b810e8250b7a94ceec17')
build() {
  cd "${srcdir}"/lshw-${pkgver}
  msg "Starting make..."
  make
}

package() {
  cd "${srcdir}"/lshw-${pkgver}
  # requires glade-2
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-gui
    
  # Place the desktop file and logo
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}"/${pkgname}.xpm "${pkgdir}"/usr/share/pixmaps/${pkgname}.xpm 
    
  # Default gui is gtk-lshw, change that to lshw-gtk for better naming convention
  install -dm755 "${pkgdir}"/usr/bin
  mv "${pkgdir}"/usr/sbin/gtk-lshw $pkgdir/usr/bin/lshw-gtk
  mv "${pkgdir}"/usr/sbin/lshw $pkgdir/usr/bin/lshw
  rm -r "${pkgdir}"/usr/sbin
}
