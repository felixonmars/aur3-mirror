# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=libbassopus
pkgver=2.4.1.3
pkgrel=1
pkgdesc="An extension to the BASS audio library, enabling the playing of Opus encoded files."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=('http://www.un4seen.com/files/bassopus24-linux.zip' 'LICENSE')
md5sums=('ee0c86f5c09c16cd112e7e0a851734ba'
         '9ba933735ead25f00741f2e6d3abed05')

package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/bassopus.h" "$pkgdir/usr/include/"
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/include/bassopus.h"
}
