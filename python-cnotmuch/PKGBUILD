# $Id$
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-cnotmuch
pkgver=0.2.2
pkgrel=1
pkgdesc="Python binding of the notmuch mail search and indexing library."
url="http://bitbucket.org/spaetz/cnotmuch"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python' 'notmuch')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://pypi.python.org/packages/source/c/cnotmuch/cnotmuch-$pkgver.tar.gz)
md5sums=('f4c7ff1885590475406828c4e00a2819')

build() {
  cd $startdir/src/cnotmuch-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=/usr --root=$pkgdir || return 1
}