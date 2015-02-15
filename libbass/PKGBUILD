# Maintainer: Robert La Spina <rkidlaspina [at] gmail [dot] com>
pkgname=libbass
pkgver=2.4.11
pkgrel=1
pkgdesc="an audio library for use in software on several platforms."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/bass.html"
license=('custom')
depends=(alsa-lib)
makedepends=(unzip)
provides=(libbass-mp3-free)
source=(http://us.un4seen.com/files/bass24-linux.zip LICENSE)
md5sums=('07cc66370c415f512682d679ec723573'
         '9ba933735ead25f00741f2e6d3abed05')

#build() {
#
#}

package() {
	mkdir -p $pkgdir/usr/lib/
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	mkdir -p $pkgdir/usr/include

	cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname
	cp $srcdir/bass.chm $pkgdir/usr/share/doc/$pkgname
	cp $srcdir/bass.h $pkgdir/usr/include/
	[ "$CARCH" == i686 ] && install -Dm755 $srcdir/libbass.so $pkgdir/usr/lib/libbass.so

	[ "$CARCH" == x86_64 ] && install -Dm755 $srcdir/x64/libbass.so $pkgdir/usr/lib/libbass.so

	chmod -R 644 $pkgdir/usr/share/licenses/$pkgname/LICENSE
	chmod -R 644 $pkgdir/usr/share/doc/$pkgname/bass.chm
	chmod -R 644 $pkgdir/usr/include/bass.h
}
