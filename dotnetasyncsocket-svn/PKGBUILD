pkgname=dotnetasyncsocket-svn
pkgver=15
pkgrel=4
pkgdesc="TCP/IP socket networking library for .Net. It's fully asynchronous, with complete delegate support."
arch=(i686 x86_64)
license=("MIT")
depends=(mono)
makedepends=(subversion)
url="http://code.google.com/p/dotnetasyncsocket"
source=("${pkgname%-*}::svn+http://dotnetasyncsocket.googlecode.com/svn/trunk/"
"AsyncSocket.snk"
"deusty-net.pc.in")
md5sums=('SKIP'
         'a2ff5f67d2846134271b440dbf711ace'
         '4c294723acddb2431041248284c82e2b')

pkgver() {
	cd "$SRCDEST/${pkgname%-*}"
	svnversion
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	xbuild AsyncSocket.sln
	cd "AsyncSocket/bin/Debug"
	monodis Deusty.Net.dll --output=Deusty.Net.il
	ilasm /dll /key:$srcdir/AsyncSocket.snk Deusty.Net.il
}

package() {
	cd "${srcdir}/${pkgname%-*}/AsyncSocket/bin/Debug"
	install -Dm644 "Deusty.Net.dll" "$pkgdir/usr/lib/dotnetasyncsocket/Deusty.Net.dll"
	install -m644 "Deusty.Net.dll.mdb" "$pkgdir/usr/lib/dotnetasyncsocket/"
	gacutil -i "Deusty.Net.dll" -root "$pkgdir/usr/lib"
	find "$pkgdir/usr/lib/dotnetasyncsocket/" -name '*.dll' -o -name '*.exe' | xargs -rtl1 mono --aot
	install -Dm644 "$srcdir/deusty-net.pc.in" "$pkgdir/usr/lib/pkgconfig/deusty-net.pc"
  sed -i "s|@VERSION@|$pkgver|" "$pkgdir/usr/lib/pkgconfig/deusty-net.pc"
}
