# Maintainer: perlawk

pkgname=ibison
_pkgname=iBison
pkgver=2.3
pkgrel=1
pkgdesc="Interactive Mode Bison is a yacc grammar debugger."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.cs.uic.edu/~spopuri/ibison.html"
depends=('glibc' 'm4' 'sh')
groups=('base-devel')
options=('staticlibs')
source=("http://www.cs.uic.edu/~spopuri/iBison.tar.bz2"
"ibison")

build() {
  cd ${srcdir}/${_pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}
	mkdir -p "$pkgdir/usr/lib"

	make DESTDIR="$pkgdir" install
	mv "$pkgdir"/usr/lib/liby.a "$pkgdir/usr/lib"/libiy.a
	mv "$pkgdir"/usr/share/bison "$pkgdir"/usr/share/ibison
	mv "$pkgdir"/usr/bin/bison "$pkgdir/usr/share"/ibison/
	cp "$srcdir"/ibison "$pkgdir/usr/bin"

	rm -rf "$pkgdir/usr/share/aclocal"
	rm -rf "$pkgdir/usr/share/locale"
	rm -rf "$pkgdir/usr/share/bison"
	rm -rf "$pkgdir/usr/man/"
	rm -rf "$pkgdir/usr/info/"
	rm -rf "$pkgdir/usr/bin/yacc"
}
md5sums=('92158b65414fe8ded172405b2cc2fdbd'
         '34e9bb6cf6fef2bfd8a5470ce0dc2bab')
