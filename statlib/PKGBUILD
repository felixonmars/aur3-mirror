# Contributor: Luis Useche <useche@gmail.com>
pkgname=statlib
pkgver=1.1
pkgrel=1
pkgdesc="Python module that combines several statistics modules into a single package"
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-statlib/"
license=('MIT')
depends=('python')
install=
source=(http://python-statlib.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d205120e7657ec345665e040b1d33fc3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
