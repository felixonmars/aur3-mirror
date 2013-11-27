_pkgname=lua-yajl
pkgname=$_pkgname-git
pkgver=24.b62f110
pkgrel=1
pkgdesc="Integrates the yajl JSON library with Lua."
arch=('i686' 'x86_64')
url="https://github.com/brimworks/$_pkgname"
license=('MIT')
depends=('yajl>=2' 'lua>=5.1')
makedepends=('git' 'cmake')
options=(!libtool)
source=(
	"git://github.com/brimworks/$_pkgname.git"
	"LICENSE"
)
sha256sums=(
	'SKIP'
	'9f8ba44e3e19973921c673d180e920995770dafbba209c388d59cd8948b15774'
)
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"

	cmake .
	make
}

package(){
	cd "$srcdir/$_gitname"

	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/lib/lua/5.1"
	mv -t "$pkgdir/usr/lib/lua/5.1/" "$pkgdir/usr/local/share/lua/cmod/"*
	rm -R "$pkgdir/usr/local"
}
