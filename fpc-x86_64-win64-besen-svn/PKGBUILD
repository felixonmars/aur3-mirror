pkgname=fpc-x86_64-win64-besen-svn
pkgver=12
pkgrel=2
pkgdesc="Complete ECMAScript Fifth Edition Implemention in Object Pascal (x86_64-win64)"
url="http://code.google.com/p/besen"
license=("LGPL")
arch=(any)
options=(!strip)
makedepends=(fpc subversion mingw-w64-binutils)
depends=(fpc-x86_64-win64-rtl)
source=("${pkgname%-*}::svn+http://besen.googlecode.com/svn/trunk/")
md5sums=('SKIP')

_unittgt=x86_64-win64
_fpcver=`fpc -iV`

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}/src"
	
	fpc -Twin64 BESEN.pas
	fpc -Twin64 BESEN.pas
	fpc -Twin64 BESEN.pas
	fpc -Twin64 BESEN.pas
	fpc -Twin64 BESEN.pas
}

package() {
	cd "${srcdir}/${pkgname%-*}/src"
	find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/besen/"{}
	find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 x86_64-w64-mingw32-strip -g
}
