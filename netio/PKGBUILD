# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Stijn Segers <`echo 'moc tod liamg ta skcuneeltog' | rev`>
pkgname=netio
pkgver=1.32
pkgrel=1
pkgdesc="Network throughput benchmark"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://www.ars.de/ars/ars.nsf/docs/netio"
license=('custom')
changelog=Changelog
source=('http://www.ars.de/ars/ars.nsf/f24a6a0b94c22d82862566960071bf5a/aa577bc4be573b05c125706d004c75b5/\$FILE/netio132.zip')
sha256sums=('c21550dfac6634558a7a79957eed28c46c62e0543017ef9d5c97c49f3cd41ddd')

build() {
	cd $srcdir
	make linux
}

package() {
	cd $srcdir
	install -Dm755 netio $pkgdir/usr/bin/netio

	# Copy license file (or what looks like it)
	install -Dm644 netio.doc $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

