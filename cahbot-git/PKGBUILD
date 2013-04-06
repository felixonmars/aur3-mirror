pkgname=cahbot-git
pkgver=84c0af1
pkgrel=1
pkgdesc="An IRC bot which lets you play Card Against Humanity. Written in Nimrod."
arch=(i686 x86_64)
url="https://github.com/dom96/c4hbot"
license=("BSD")
makedepends=(nimrod git)
source=("${pkgname%-*}::git+https://github.com/dom96/c4hbot.git"
"cahbot.nim.patch")
md5sums=('SKIP' '68198f70a8ddfeea170b315142b804e8')

pkgver () {
	cd "$SRCDEST/${pkgname%-*}"
	echo "$(git describe --always | sed s/${_pkgname}-// | sed 's/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	patch -Np0 cahbot.nim < $srcdir/cahbot.nim.patch
	nimrod c -d:release cahbot.nim
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "cahbot" "$pkgdir/usr/lib/cahbot/cahbot"
	install -Dm644 "decks/default.deck" "$pkgdir/usr/lib/cahbot/decks/default.deck"
	ln -s "/usr/lib/cahbot/cahbot" "$pkgdir/usr/bin/cahbot"
}
