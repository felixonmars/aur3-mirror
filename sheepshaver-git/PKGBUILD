pkgname=sheepshaver-git
pkgver=2307
pkgrel=1
pkgdesc="An Open Source PowerPC MacOS run-time environment"
arch=(i686 x86_64)
url="http://sheepshaver.cebix.net"
license=("GPL")
depends=(gtk2 sdl libxxf86dga libxxf86vm)
makedepends=(autoconf git)
conflicts=(sheepshaver)
provides=(sheepshaver)
source=("${pkgname%-*}::git+git://github.com/cebix/macemu.git"
"http://sheepshaver.cebix.net/images/sheep.png"
"SheepShaver.desktop")
md5sums=('SKIP' '694e1efa81d9faf6dbd514938340c260' '8fb9c2cce0c0b35fecc27b169db0514d')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

build() {
	cd "${srcdir}/${pkgname%-*}/SheepShaver"
	make links
	cd "src/Unix"
	./autogen.sh \
		--prefix=/usr \
		--enable-sdl-audio \
		--without-esd
	mkdir obj
	make
}

package() {
	cd "${srcdir}/${pkgname%-*}/SheepShaver/src/Unix"
	make DESTDIR="$pkgdir/" install
	install -m644 "$srcdir/sheep.png" "$pkgdir/usr/share/SheepShaver"
	install -Dm644 "$srcdir/SheepShaver.desktop" "$pkgdir/usr/share/applications/SheepShaver.desktop"
	install -d -m 755 "$pkgdir/usr/share/doc/SheepShaver"
	cd "${srcdir}/${pkgname%-*}/SheepShaver/doc/Linux"
	install -m644 *.html *.gif "$pkgdir/usr/share/doc/SheepShaver"
}
