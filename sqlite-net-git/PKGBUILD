pkgname=sqlite-net-git
pkgver=296
pkgrel=2
pkgdesc="Simple, powerful, cross-platform SQLite client and ORM"
arch=(any)
license=("custom")
depends=(sqlite mono)
makedepends=(git)
url="https://github.com/praeclarum/sqlite-net"
source=("${pkgname%-*}::git+https://github.com/praeclarum/sqlite-net.git"
"sqlite-net.pc" "sqlite-net.snk" "sqlite-net.dll.config")
md5sums=('SKIP'
         'b47faf52ce43179ed21fa668d8e6a4b3'
         '7cf6fe867f756dfc1807a14570ac18c8'
         '37454cd8b1d5b75b89c878d4a3a23be7')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	echo $(git rev-list --count master)
}

build() {
	cd "${srcdir}/${pkgname%-*}/src"
	mcs /out:sqlite-net.dll /keyfile:../../sqlite-net.snk /debug:pdbonly /t:library \
		SQLite.cs SQLiteAsync.cs
}

package() {
	cd "${srcdir}/${pkgname%-*}/src"
	find . -name '*.dll*' -exec install -Dm644 {} "$pkgdir/usr/lib/sqlite-net/"{} \;
	install -m644 "$srcdir/sqlite-net.dll.config" "$pkgdir/usr/lib/sqlite-net/"
	gacutil -i "$pkgdir/usr/lib/sqlite-net/sqlite-net.dll" -root "$pkgdir/usr/lib"
	install -Dm644 "$srcdir/sqlite-net.pc" "$pkgdir/usr/lib/pkgconfig/sqlite-net.pc"
	install -Dm644 ../license.md "$pkgdir/usr/share/licenses/sqlite-net/license.md"
}
