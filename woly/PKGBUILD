
pkgname=woly
pkgver=3.2
pkgrel=1
pkgdesc="A Wake On Lan Tool with IPv6 support"
arch=('i686' 'x86_64')
url="https://github.com/Asfaloth/Woly"
license=('unknown')
groups=()
depends=('boost-libs')
# changelog=
source=(https://github.com/downloads/Asfaloth/Woly/$pkgname-v$pkgver.tar.gz)
noextract=()
md5sums=('936da28f918d8693eb325e1406beb53e')

build() {
	cd "$srcdir/Woly/"
	./compile.sh
}

package() {
	cd "$srcdir/Woly/"
	mkdir -p $pkgdir/usr/bin/
	mv ./woly $pkgdir/usr/bin/
}

