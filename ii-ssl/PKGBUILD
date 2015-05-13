# Contributor: Evan Gates    <evan.gates@gmail.com>
# Contributor: Dag  Odenhall <dag.odenhall@gmail.com>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: William Giokas <1007380@gmail.com>
# Contributor: Jonathan De Beir <jonathan.de.beir@gmail.com>
_pkgname=ii
pkgname=$_pkgname-ssl
pkgver=1.7
pkgrel=2
pkgdesc="A minimalist FIFO and filesystem-based IRC client with SSL support"
license=(MIT)
arch=(i686 x86_64)
url=http://tools.suckless.org/ii
depends=(glibc)
conflicts=(ii)
source=("http://dl.suckless.org/tools/${_pkgname}-${pkgver}.tar.gz"
	"http://tools.suckless.org/ii/patches/${_pkgname}-${pkgver}-ssl.diff")

md5sums=('6191008ca09770873d84f40270493d0e'
	 'b138587fb486c25f08af3eb39e460c65')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -uNp1 -i $srcdir/$_pkgname-$pkgver-ssl.diff
	sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
}
