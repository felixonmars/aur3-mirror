pkgname=fpc-x86_64-win64-ppruby-git
pkgver=0.9.2.2.1
pkgrel=1
pkgdesc="Ruby binding units for FreePascal (x86_64-win64)"
url="https://github.com/shikhalev/ppruby"
license=("GPLv3")
arch=(any)
depends=(fpc-x86_64-win64-rtl)
makedepends=(fpc git mingw-w64-binutils)
options=(!strip)
source=("${pkgname%-*}::git+https://github.com/shikhalev/ppruby.git")
md5sums=('SKIP')

_unittgt=x86_64-win64
_fpcver=`fpc -iV`

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	git describe | sed 's|\(.*-.*\)-.*|\1|;s|-|.|'
}

build() {
	cd "${srcdir}/${pkgname%-*}/static"
	fpc -Twin64 ruby18.pp
}

package() {
	cd "${srcdir}/${pkgname%-*}/static"
	find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a' |
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/ppruby/"{}
	find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
