# Contributor: Julien Ugon <bzklrm at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Gustavao A. Gomez Farhat <gustavo_gomez_farhat_at_gmail_dot_com>

pkgname=cvxopt
pkgver=1.1.7
pkgrel=1
pkgdesc="A free software package for convex optimization written in Python"
url="http://abel.ee.ucla.edu/cvxopt"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('lapack' 'python')
source=(https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
md5sums=('3073a5da23cb5a77d3bc143edde1e4f1')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
  python setup.py install --root=$pkgdir
}
