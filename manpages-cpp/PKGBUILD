# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=manpages-cpp
pkgver=0.1.9
pkgrel=2
pkgdesc="manpages-cpp is a project that generates C++ man pages from cplusplus.com"
arch=('any')
url="https://github.com/Aitjcize/manpages-cpp"
license=('GPLv3')
depends=(python2 vim sqlite3 groff)
source=(https://github.com/downloads/Aitjcize/manpages-cpp/${pkgname}-${pkgver}.tar.gz)
md5sums=('31560c3f9996588d3b8ec02b4ecc2896')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
