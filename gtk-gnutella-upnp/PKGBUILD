# Maintainer:  Thomas Mudrunka <harvie@@email..cz>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=gtk-gnutella-upnp
pkgver=1.1
pkgrel=1
pkgdesc="Small wrapper to automatically enable upnp port-forwarding for gtk-gnutella (doesn't work with port randomizing)"
arch=('any')
license=('GPL')
url="http://gtk-gnutella.sourceforge.net/"
depends=(gtk-gnutella miniupnpc)
source=("gtk-gnutella-upnp.sh" "gtk-gnutella-upnp.desktop")
md5sums=('a6c682400f582def99e99e0834d004d9'
         'a80c6de2b89bd3f2d13dca3869c81c27')

build() {
  mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/gtk-gnutella-upnp.sh ${pkgdir}/usr/bin/gtk-gnutella-upnp
  mkdir -p ${pkgdir}/usr/share/applications
	cp ${srcdir}/gtk-gnutella-upnp.desktop ${pkgdir}/usr/share/applications/
	chmod -R 755 ${pkgdir}
}
