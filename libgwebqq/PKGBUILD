# Maintainer: Chunfeng Zhang <CrazyPandar@gmail.com>

pkgname=libgwebqq
pkgver=0.0.1
pkgrel=2
pkgdesc="libgwebqq is a qq client library uses webqq protocol"
arch=('i686')
url="https://github.com/CrazyPandar/libgwebqq"
license=('LGPL')
#groups=('base-devel')
depends=('glib2')

source=(https://github.com/downloads/CrazyPandar/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1d7b007a6fb065ccbd160e95cef7b671')

build() {
 cd "$srcdir"
 ./configure LDFLAGS=""
 make || return 1
}

package() {
 cd "$srcdir"
 make install DESTDIR="$pkgdir"
 rm ${pkgdir}/usr/lib/libgwebqq.so.deplibs
}
