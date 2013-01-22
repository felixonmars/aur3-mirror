# Maintainer: Brian Hood <brianh6854@googlemail.com>

pkgname=python2-monetdb
pkgver=11.13.7
pkgrel=1
pkgdesc="Python binding for MonetDB version $pkgver"
arch=('i686' 'x86_64')
url="http://www.monetdb.org/Home"
license=('custom')
source=("http://dev.monetdb.org/downloads/sources/Latest/python2-monetdb-$pkgver.tar.bz2")
sha1sums=('bfce01ace8e55d05b248fd488633eb963dd6a77e')
depends=('python2')
makedepends=('python2')

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
