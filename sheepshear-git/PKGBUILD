pkgname=sheepshear-git
pkgver=1041
pkgrel=1
pkgdesc="SheepShear, an advanced PowerPC emulator designed to run MacOS classic"
arch=(i686 x86_64)
url="https://github.com/kallisti5/sheepshear"
license=("GPLv2")
depends=(libxxf86dga gtk2 libxxf86vm)
makedepends=(git scons)
source=("${pkgname%-*}::git+https://github.com/kallisti5/sheepshear.git"
"http://sheepshaver.cebix.net/images/sheep.png"
"sheepshear.desktop")
md5sums=('SKIP' '694e1efa81d9faf6dbd514938340c260' '4865b509b9d652a56fde6af226a205e2')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	scons
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm755 "build-release/SheepShear" "$pkgdir/usr/bin/sheepshear"
	install -Dm644 "$srcdir/sheep.png" "$pkgdir/usr/share/icons/sheepshear.png"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/sheepshear/COPYING"
	install -m644 README.md "$pkgdir/usr/share/licenses/sheepshear/"
	install -Dm644 "$srcdir/sheepshear.desktop" "$pkgdir/usr/share/applications/sheepshear.desktop"
} 
