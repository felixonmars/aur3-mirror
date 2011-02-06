# Contributor : Aaron Bishop <erroneous@gmail.com>

pkgname=gmediaserver
pkgver=0.13.0
pkgdesc="A UPnP compatible media server for the GNU system."
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gmediaserver/"
depends=('libupnp' 'file')
makedepends=('gcc>=2.95')
conflicts=()
license=('GPL')
source=(http://download.savannah.gnu.org/releases/gmediaserver/gmediaserver-latest.tar.gz)
md5sums=('c422de386331e2a1a859d45f6fa270a3')
build()
{
	cd $startdir/src/gmediaserver-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
	echo It is recommended that you install id3lib, taglib, and e2fsprogs for full functionality with GMediaServer
}
