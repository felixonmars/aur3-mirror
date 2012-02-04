#Contributor: SoulFire <soulfire@fastwebnet.it>
pkgname=bitswash
pkgver=0.0.6
pkgrel=1
pkgdesc="Crossplatform Bittorrent Client"
url="http://www.bitswash.org/index.php"
arch=('i686')
license="gpl2"
depends=('openssl' 'wxgtk' 'boost' 'libtorrent')
source=(http://kent.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('8f2bdc141a8cbec7dc2d57e77be9d42f')

build () {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --with-boost-thread=mt
	make || return 1
	make prefix=$startdir/pkg/usr install
}
