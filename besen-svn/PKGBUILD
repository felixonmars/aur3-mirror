pkgname=besen-svn
pkgver=12
pkgrel=2
pkgdesc="Complete ECMAScript Fifth Edition Implemention in Object Pascal"
url="http://code.google.com/p/besen"
license=("LGPL")
arch=(i686 x86_64)
makedepends=(subversion)
depends=(fpc)
source=("${pkgname%-*}::svn+http://besen.googlecode.com/svn/trunk/")
md5sums=('SKIP')

_unittgt=`fpc -iSP`-`fpc -iSO`
_fpcver=`fpc -iV`

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}/src"

	fpc BESEN.pas
	fpc BESEN.pas
	fpc BESEN.pas
	fpc BESEN.pas
	fpc BESEN.pas
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm644 copying.besen "$pkgdir/usr/share/licenses/$pkgname/copying.besen"
	install -m644 copying.txt "$pkgdir/usr/share/licenses/$pkgname/copying.txt"
	cd "src"
	find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/besen/"{}
}
