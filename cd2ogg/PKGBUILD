# Maintainer: Yochai Gal <yochaigal at gmail dot com>
pkgname=cd2ogg
pkgver=3.3
pkgrel=1
pkgdesc=" cd2ogg is a script to rip and encode CDs with minimal user intervention with a wide array of popular formats supported, including Ogg/Vorbis, MP3 & FLAC."
arch=('any')
url="http://cd2ogg.sourceforge.net/"
license=('GPL')
depends=('curl' 'vorbis-tools' 'cdparanoia' 'bc' 'cd-discid' 'flac')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('fe5618e86ba4cf811a1eeda8935c1533')

build(){
	cd "$srcdir"
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/man/man1
	mkdir -p "$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
}
package(){
	cd "$srcdir/$pkgname-$pkgver"
	cp "$pkgname" "$pkgdir"/usr/bin/
  	cp "$pkgname".1.gz "$pkgdir"/usr/share/man/man1/
  	cp README COPYING CHANGELOG "$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
}

