pkgname=lidgren-network-gen3-base
pkgver=2012.12.18
pkgrel=1
pkgdesc="Lidgren networking library generation 3 (base)"
arch=(any)
license=("MIT")
depends=(mono)
makedepends=(mono dos2unix)
conflicts=(lidgren-network-gen3)
url="http://code.google.com/p/lidgren-network-gen3"
source=("http://lidgren-network-gen3.googlecode.com/files/lidgren-network-gen3-${pkgver//./-}.zip")
md5sums=('3c2ab08486c5e6d38a1b81851332e97b')

build() {
	cd "$srcdir/Lidgren-network-gen3"
	find . -type f -exec dos2unix {} \;
	xbuild Lidgren.Network.sln
}

package() {
	cd "$srcdir/Lidgren-network-gen3/Lidgren.Network/bin/Debug"
	find . -name '*.dll' -o -name '*.mdb' -o -name '*.config' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/lidgren-network/"{}
}
