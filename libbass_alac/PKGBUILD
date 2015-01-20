# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=libbass_alac
pkgver=2.4.3
pkgrel=1
pkgdesc="An extension enabling the playback of ALAC (Apple Lossless) encoded files."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=('http://un4seen.com/files/z/2/bass_alac24-linux.zip' 'LICENSE')
md5sums=('4a1e6951aa8ead2580c5aa7fa095a4f8'
         '9ba933735ead25f00741f2e6d3abed05')

package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/c/bass_alac.h" "$pkgdir/usr/include/"
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/include/bass_alac.h"
}
