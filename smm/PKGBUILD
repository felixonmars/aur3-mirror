# Contributor: David Valentim Dias <dvdscripter@gmail.com>
pkgname=smm
pkgver=611
pkgrel=2
pkgdesc="A mud client with extended and unique features."
arch=('i686')
url="http://smm.sourceforge.net/portal/html"
license=('GPL')
depends=('iwidgets')
source=(http://downloads.sourceforge.net/smm/$pkgname$pkgver.tgz)
md5sums=('ae209181d66a9dcd375a759972b1656c')

build() {
  cd "$startdir/src/smm/Install.unix"
  sed -i "s|/usr/local|$startdir/pkg/usr|" Makefile
  make || return 1
  sed -i "s|$startdir/pkg||" smm
  make install
}

# vim:set ts=2 sw=2 et:
