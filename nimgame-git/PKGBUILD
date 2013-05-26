pkgname=nimgame-git
pkgver=v0.3.4
pkgrel=3
pkgdesc="Simple 2D game engine for Nimrod language."
arch=(any)
url="https://github.com/Vladar4/nimgame"
license=("custom")
makedepends=(git)
depends=(nimrod)
source=("${pkgname%-*}::git+https://github.com/Vladar4/nimgame.git")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	git describe | sed 's|\(.*-.*\)-.*|\1|;s|-|.|'
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	for file in `find "doc/" -name '*.html'`; do
    install -Dm644 $file "$pkgdir/usr/share/nimrod/doc/nimgame/${file#doc/}"
  done
	for file in `find "lib/" -name '*.nim'`; do
    install -Dm644 $file "$pkgdir/usr/lib/nimrod/packages/nimgame/${file#lib/}"
  done
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/nimgame/LICENSE.md"
	install -Dm644 "fnt/default8x16.png" "$pkgdir/usr/share/nimrod/resources/nimgame/default8x16.png"
}
