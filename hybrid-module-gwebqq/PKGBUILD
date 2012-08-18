# Maintainer: Chunfeng Zhang <CrazyPandar@gmail.com>

pkgname=hybrid-module-gwebqq
pkgver=0.0.2
pkgrel=1
pkgdesc="webqq plugin for hybrid IM"
arch=('i686')
url="https://github.com/CrazyPandar/hybrid-module-gwebqq"
license=('LGPL')
#groups=('base-devel')
depends=('libgwebqq' 'hybrid-im-git')
source=(https://github.com/downloads/CrazyPandar/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f40ec00d519cf339394de66abc74458e')

build() {
 cd "$srcdir"
 ./configure LDFLAGS=""
 make || return 1
}

package() {
 cd "$srcdir"
 make install DESTDIR="$pkgdir"
}
