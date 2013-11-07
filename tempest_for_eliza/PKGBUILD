# Maintainer: Abelardo "Abby" Ricart <abby@memnix.com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=tempest_for_eliza
pkgver=1.0.5
pkgrel=3
pkgdesc="Use your CRT monitor to send out AM radio signals (you can listen to computer generated music in radio)"
url="http://www.erikyyy.de/tempest"
license=('GPL')
depends=('sdl')
makedepends=()
conflicts=()
replaces=()
backup=()
install=tempest.install
source=(http://www.erikyyy.de/tempest/$pkgname-$pkgver.tar.gz)
md5sums=('e29c700a7ae15aaaa4c36cbe94e38afc')
arch=('i686' 'x86_64')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	
	rm songs/Makefile*
	mkdir -p "$pkgdir/usr/share/tempest_for_eliza/songs"
	
	install -Dm644 "$srcdir/$pkgname-$pkgver/README"	"$pkgdir/usr/share/tempest_for_eliza/"
	install -Dm644 "$srcdir/$pkgname-$pkgver/AUTHORS"	"$pkgdir/usr/share/tempest_for_eliza/"
	install -Dm644 "$srcdir/$pkgname-$pkgver"/songs/*	"$pkgdir/usr/share/tempest_for_eliza/songs/"
	install -Dm755 "$srcdir/$pkgname-$pkgver/mksong.sh"	"$pkgdir/usr/bin/"
}
