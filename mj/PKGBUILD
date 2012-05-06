# Contributor: david "mutterschiff" becker <david dot becker at gmx dot org>

pkgname=mj
pkgver=1.12.1
pkgrel=1
pkgdesc="Mah-Jong game for four player (server and CPU-player-client included)"
arch=('i686' 'x86_64')
url="http://mahjong.julianbradfield.org/"
license=('GPL2')
depends=('gtk2')
makedepends=('glibmm' 'perl')
install=xmj.install
source=(http://mahjong.julianbradfield.org/Source/$pkgname-$pkgver-src.tar.gz)
md5sums=('a74acae39d6a49bad9c34b84088f72f3')

build() {
	cd $pkgname-$pkgver-src
	make LDLIBS=/lib/libm.so.6 -s
}

package() {
	install -d "${pkgdir}/usr/share/doc/xmj/"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/rules.txt" "${pkgdir}/usr/share/doc/xmj/"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/use.txt" "${pkgdir}/usr/share/doc/xmj/"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/LICENCE" "${pkgdir}/usr/share/doc/xmj/"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/CHANGES" "${pkgdir}/usr/share/doc/xmj/"
	
	install -d "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/$pkgname-$pkgver-src/mj-player" "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/$pkgname-$pkgver-src/mj-server" "${pkgdir}/usr/bin/"
	install -Dm755 "${srcdir}/$pkgname-$pkgver-src/xmj" "${pkgdir}/usr/bin/"
	
	install -d "${pkgdir}/usr/share/man/man1"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/mj-player.man" "${pkgdir}/usr/share/man/man1/mj-player.1"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/mj-server.man" "${pkgdir}/usr/share/man/man1/mj-server.1"
	install -Dm644 "${srcdir}/$pkgname-$pkgver-src/xmj.man" "${pkgdir}/usr/share/man/man1/xmj.1"
}
