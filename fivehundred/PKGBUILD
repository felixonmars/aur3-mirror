# Maintainer: Oliver Giles <ohw period giles at gmail>
pkgname=fivehundred
pkgver=1.0
pkgrel=1
pkgdesc="A scriptable four-player card game"
arch=('i686' 'x86_64')
url="http://fivehundred.sf.net"
license=('GPL3')
groups=()
depends=('qt>=4.5' 'lua>=5.1.0')
makedepends=('subversion' 'cmake>=2.8')
source=(fivehundred-1.0.tar.gz::http://fivehundred.svn.sourceforge.net/viewvc/fivehundred/tags/1.0/?view=tar)
md5sums=(9c556b866c1f3a6742643ba8dd85a4a5)

build() {
	cd "$srcdir"
	rm -rf build
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../src
	make -j4
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
