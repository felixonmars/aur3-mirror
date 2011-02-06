# Maintainer: Peter Mylemans <peter.mylemans@gmail.com>
# Contributor: Peter Mylemans <peter.mylemans@gmail.com>

pkgname=rampartc
pkgver=1.3.0
pkgrel=1
pkgdesc="Apache Rampart/C is the security module for Apache Axis2/C."
arch=('i686' 'x86_64')
url="http://axis.apache.org/axis2/c/rampart/"
license=('APL')
depends=('axis2c')
makedepends=()
source=(http://apache.belnet.be//ws/rampart/c/1_3_0/rampartc-src-1.3.0.tar.gz)
md5sums=('3420fd8cdd4c70e6f18c27c94ba86384')

AXIS2C_HOME=/usr/lib/axis2c

build() {
  pushd $srcdir/$pkgname-src-$pkgver
    patch -p2 < $startdir/make_paths.patch
    autoreconf -i

    ./configure --prefix=$AXIS2C_HOME --enable-static=no --with-axis2=${AXIS2C_HOME}/include/axis2-1.6.0 CFLAGS=-w
    make
  popd
}

package() {
  pushd $srcdir/$pkgname-src-$pkgver
    make DESTDIR=$pkgdir install
  popd
}
