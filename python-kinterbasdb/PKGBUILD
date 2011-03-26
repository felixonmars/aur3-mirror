# Maintainer: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-kinterbasdb
pkgver=3.3.0
pkgrel=1
pkgdesc="A Python Extension Package for the Firebird and Interbase Relational Databases."
arch=('i686')
license=('CUSTOM:KINTERBASDB')
depends=('python' 'libfbclient')
source=("http://downloads.sourceforge.net/sourceforge/firebird/kinterbasdb-$pkgver.tar.bz2")
url="http://kinterbasdb.sourceforge.net/"

build() {
  cd $startdir/src/kinterbasdb-$pkgver
  python setup.py install --root=$startdir/pkg
 
  msg "Installing the LICENSE"
  install -D -m644 ${srcdir}/kinterbasdb-3.3.0/docs/license.html $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('0296d2dbc7b76dac140b5fec2ad59f0e')
