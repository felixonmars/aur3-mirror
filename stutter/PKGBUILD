# Maintainer: perlawk
pkgname=stutter
pkgver=0.16
pkgrel=1
pkgdesc="A programming language reminiscent of LISP, with interface to C, sqlite, XML."
url="http://galaru.net/stutter/"
arch=('x86_64' 'i686')
license=('GPLv3')
makedep=('sqlite3' 'readline')
source=("http://galaru.net/stutter/$pkgname-$pkgver.tar.gz")
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	if [ $CARCH == 'x86_64' ]; then 
		PREFIX=/usr RELEASE=1 WITH_SQLITE=1 WITH_XML=1 CFLAGS=-fpic AMD=1 make
	else
		PREFIX=/usr RELEASE=1 WITH_SQLITE=1 WITH_XML=1 CFLAGS=-fpic make
	fi
}
 
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/lib
	mkdir -p "$pkgdir"/usr/include/sutter
	mkdir -p "$pkgdir"/usr/share/stutter/doc

	cp shell/stt  "$pkgdir"/usr/bin
	cp stutter/lib*[oa]   "$pkgdir"/usr/lib
	cp stutter/lib/* "$pkgdir"/usr/share/stutter
	cp -a doc "$pkgdir"/usr/share/stutter
	cp stutter/*.h "$pkgdir"/usr/include/sutter
}
md5sums=('9da44c787112f4827baf55e6d11785da')
