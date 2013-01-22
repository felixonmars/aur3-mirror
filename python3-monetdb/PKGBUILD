# Maintainer: Brian Hood <brianh6854@googlemail.com>

pkgname=python3-monetdb
pkgver=11.13.7
pkgrel=1
pkgdesc="Python binding for MonetDB version $pkgver"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
source=("http://dev.monetdb.org/downloads/sources/Latest/python3-monetdb-$pkgver.tar.bz2")
sha1sums=('6df29e10655586beb15068ffde47887a3a115a30')
depends=('python3')
makedepends=('python3')

build() {
  rm -Rf $srcdir/build
  mkdir $srcdir/build
  cd $srcdir/build

}
package() {
  cd $srcdir/python-monetdb-$pkgver
  python setup.py install
}

# vim:syntax=sh
