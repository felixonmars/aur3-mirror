# Maintainer: Jacob Courtneay <jacob@sporkexec.com>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# AUR Category: lib
pkgname=pygresql
_pkgname=PyGreSQL
pkgver=4.0
pkgrel=2
pkgdesc="Python access for PostgreSQL"
url="http://www.pygresql.org/"
license="BSD"
depends=(python2 postgresql postgresql-libs)
arch=(i686 x86_64)
source=(http://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('1aca50e59ff4cc56abe9452a9a49c5ff')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$pkgdir || return 1
}
