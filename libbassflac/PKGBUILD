# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=libbassflac
pkgver=2.4.1
pkgrel=1
pkgdesc="An extension enabling the playback of FLAC (inc. Ogg FLAC) encoded files and streams."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=('http://www.un4seen.com/files/bassflac24-linux.zip' 'LICENSE')
md5sums=('bf09e409115b9e5a01f08e4a0a478d10'
         '9ba933735ead25f00741f2e6d3abed05')

package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/bassflac.h" "$pkgdir/usr/include/"
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/include/bassflac.h"
}
