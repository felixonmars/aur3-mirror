# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=amule-gnome-support
pkgver=2.3.1
pkgrel=1
pkgdesc="eD2k links handling support for GNOME web browsers"
arch=('any')
url="http://www.amule.org"
license=('GPL')
depends=('amule' 'gconf')
install=$pkgname.install
source=($pkgname.schemas)
sha1sums=('c5fb3565d97890688edd6788f5779894b1089d26')

package() {
  cd "$srcdir"

  install -d -m 755 $pkgdir/usr/share/gconf/schemas
  install -m 644 $pkgname.schemas $pkgdir/usr/share/gconf/schemas/
}

# vim:set ts=2 sw=2 et:
