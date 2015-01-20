# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=libbass_spx
pkgver=2.4.3.1
pkgrel=1
pkgdesc="An extension enabling the playback of Speex encoded files. "
arch=('i686' 'x86_64')
url="http://www.un4seen.com/"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
source=('http://un4seen.com/files/z/2/bass_spx24-linux.zip' 'LICENSE')
md5sums=('75680ef9636a49ed0d713fa6d45d60c5'
         '9ba933735ead25f00741f2e6d3abed05')

package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/c/bass_spx.h" "$pkgdir/usr/include/"
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/$pkgname.so"

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/include/bass_spx.h"
}
