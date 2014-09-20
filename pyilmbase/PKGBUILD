# Maintainer: Peter Shinners <pete@shinners.org>

pkgname=pyilmbase
pkgver=2.1.0
pkgrel=2
depends=('ilmbase' 'boost' 'python2')
pkgdesc="Python bindings for the ILM OpenEXR base libraries"
arch=(i686 x86_64)
url="http://www.openexr.com"
license=('custom')
source=(http://download.savannah.nongnu.org/releases/openexr/$pkgname-$pkgver.tar.gz)


build() {
  cd "${srcdir}/$pkgname-$pkgver"
  PYTHON=/usr/bin/python2.7 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
md5sums=('af1115f4d759c574ce84efcde9845d29')

