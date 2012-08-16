# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: system

pkgname=hterm
pkgver=0.8.1beta
pkgrel=2
pkgdesc="Terminal program"
license="Proprietary (http://www.der-hammer.info/terminal/license.txt)"
arch=(i686 x86_64)

case $CARCH in
  'i686')
    depends=('gtk2' 'libpng12' 'libsm')
    ;;
  'x86_64')
    depends=('lib32-gtk2' 'lib32-libpng12' 'lib32-libsm')
    ;;
esac

url="http://www.der-hammer.info/terminal/"
source=(http://www.der-hammer.info/terminal/${pkgname}.tar.gz)
md5sums=('2f905147ac2f66c31e3b182d1f3c72ac')

package() {
  install -m0755 -D $srcdir/hterm $pkgdir/usr/bin/hterm
  install -m0644 -D $srcdir/LICENSE.TXT $pkgdir/usr/share/doc/hterm/LICENSE.txt
}
