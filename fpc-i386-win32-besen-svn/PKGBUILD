pkgname=fpc-i386-win32-besen-svn
pkgver=12
pkgrel=2
pkgdesc="Complete ECMAScript Fifth Edition Implemention in Object Pascal (i386-win32)"
url="http://code.google.com/p/besen"
license=("LGPL")
arch=(any)
options=(!strip)
makedepends=(ppcross386 subversion mingw-w64-binutils)
depends=(fpc-i386-win32-rtl)
source=("${pkgname%-*}::svn+http://besen.googlecode.com/svn/trunk/")
md5sums=('SKIP')

_unittgt=i386-win32
_fpcver=`fpc -iV`

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}/src"
	
	ppcross386 -Twin32 BESEN.pas
	ppcross386 -Twin32 BESEN.pas
	ppcross386 -Twin32 BESEN.pas
	ppcross386 -Twin32 BESEN.pas
	ppcross386 -Twin32 BESEN.pas
}

package() {
	cd "${srcdir}/${pkgname%-*}/src"
	find . -name '*.o' -o -name '*.ppu' -o -name '*.rst' -o -name '*.a'|
		xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/lib/fpc/$_fpcver/units/$_unittgt/besen/"{}
	find $pkgdir -name '*.o' -o -name '*.a' | xargs -rtl1 i686-w64-mingw32-strip -g
}
