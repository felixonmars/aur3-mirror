# Maintainer: TDY <tdy@archlinux.info>

pkgname=python-xmms-remote
pkgver=1.13
pkgrel=2
pkgdesc="A Python wrapper for controlling XMMS via PyXMMS"
arch=('any')
url="http://people.via.ecp.fr/~flo/"
license=('GPL')
depends=('python-xmms>=2.04')
makedepends=('texi2html')
install=$pkgname.install
source=(http://people.via.ecp.fr/~flo/2002/PyXMMS-remote/dist/pyxmms-remote-$pkgver.tar.gz)
md5sums=('144c7a3141517d1f72c5d7853895ceff')

build() {
  cd "$srcdir/pyxmms-remote-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/pyxmms-remote-$pkgver"
  install -Dm755 pyxmms-remote "$pkgdir/usr/bin/pyxmms"
  install -Dm644 doc/pyxmms-remote.info "$pkgdir/usr/share/info/$pkgname.info"
  sed -e 's/pyxmms-remote\.info/python-xmms-remote.info/g' \
      -e 's/pyxmms-remote/pyxmms/g' \
      -i "$pkgdir/usr/share/info/$pkgname.info"
}

# vim:set ts=2 sw=2 et:
