# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=log4py
pkgver=1.3
pkgrel=2
pkgdesc="Python logging module similar to log4j."
arch=(i686)
url="http://www.its4you.at/english/log4py.html"
license=('MIT')
depends=('python')
source=(http://downloads.sourceforge.net/sourceforge/log4py/$pkgname-$pkgver.tar.gz)
md5sums=('dc250a8a899c7e70464d683dfc3bdc4f')


build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg
}
