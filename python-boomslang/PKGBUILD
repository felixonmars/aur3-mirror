# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Sebastien Binet <binet@lblbox>

_pkgname=boomslang
pkgname=python-boomslang
pkgver=1.2
pkgrel=1
pkgdesc="thin layer over matplotlib that simplifies creation of common plots"
url="https://alexras.github.io/boomslang/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-matplotlib')
source=(https://github.com/alexras/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('01e68146cd04854f0def86040de2c0a8')


build() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py install --prefix=/usr --root=$pkgdir
}
