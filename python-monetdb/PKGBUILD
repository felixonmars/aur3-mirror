# Maintainer: Brian Hood <brianh6854@googlemail.com>

pkgname=python-monetdb
pkgver=11.13.3
pkgrel=1
pkgdesc="Python binding for MonetDB version $pkgver"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
source=("http://dev.monetdb.org/downloads/sources/Latest/python-monetdb-$pkgver.tar.bz2")
sha1sums=('0116fcb4398174b497518589e7278f82ab74682a')
depends=('python')
makedepends=('python')


package() {
  cd $pkgname-$pkgver
  python setup.py install
}

# vim:syntax=sh
