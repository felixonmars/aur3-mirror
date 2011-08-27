# Contributor: Benjamin Hedrich <phpogo@gmx.net>


pkgname=pidgin-vnc
_pkgnamesf=${pkgname/-/_}
pkgver=0.2
pkgrel=1
pkgdesc="To start VNC desktop sharing from Pidgin conversation"
arch=('i686' 'x86_64')
url="http://pidgin-vnc.sourceforge.net"
license=('GPL2')
conflicts=()
depends=('pidgin')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$_pkgnamesf-$pkgver.tar.gz")
md5sums=('f472b0588c47b13f662c6f583e62b1c9')


build() {

	cd $srcdir/${_pkgnamesf}-$pkgver

	./configure --prefix=/usr || return 1
	make -j1 || return 1
  
}

package() {

	cd $srcdir/${_pkgnamesf}-$pkgver

	make DESTDIR="$pkgdir" install || return 1

}
