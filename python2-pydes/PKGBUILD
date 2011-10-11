# Maintainer: Emmanuel Gras <gras.emmanuel@gmail.com>

pkgname=python2-pydes
pkgver=2.0.1
pkgrel=2
pkgdesc="This is a pure python implementation of the DES encryption algorithm. It is in pure python to avoid portability issues, since most DES implementations are programmed in C (for performance reasons)."
arch=('i686' 'x86_64')
url="http://twhiteman.netfirms.com/des.html"
license=('Public Domain')
depends=('python2')
makedepends=()
source=(http://twhiteman.netfirms.com/pyDES/pyDes-2.0.1.tar.gz)
md5sums=()
conflicts=()


build() {
  cd $srcdir/pyDes-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/pyDes-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr
}
md5sums=('a6a157177de6ed2e76977cd8172198d9')
