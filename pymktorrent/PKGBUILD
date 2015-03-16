# Contributor: Nathan Owe. ndowens04 at gmail dot com

pkgname=pymktorrent
pkgver=0.3
pkgrel=2
pkgdesc="Python torrent file creation script and library. "
arch=('any')
url="https://pypi.python.org/pypi/pymktorrent/"
license=('BSD')
depends=('python2')
options=('!emptydirs')
source=(http://pypi.python.org/packages/source/p/pymktorrent/$pkgname-$pkgver.tar.gz)
md5sums=('8c132dedc6d0b37456893f0c8245f5e7')


package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/
}
