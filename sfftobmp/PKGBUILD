# Contributor: Richard Hillmann <sleeper@project0.de>

pkgname=sfftobmp
pkgver=3.1.3
pkgrel=4
pkgdesc="Converts SFF Files to BMP, JPEG or multipage TIFF formats.It is a part of sfftools"
arch=(i686 x86_64)
url="http://sfftools.sourceforge.net"
license="Copyright Peter Schaeer-Hutter"
depends=('glibc' 'libjpeg')
makedepends=('make' 'autoconf' 'automake' 'boost')

source=(http://downloads.sourceforge.net/project/sfftools/SFFTools/sfftobmp/sfftobmp3_1_3.tar.gz sfftobmp_boost.patch)

_prefix=/usr

build() {
	cd $startdir/src/sfftobmp3
	
	patch -p 0 < $startdir/sfftobmp_boost.patch 
	./configure --prefix=${_prefix} || return 1
	
	make || return 1
}
package(){
	cd $startdir/src/sfftobmp3
	mkdir -p $pkgdir/usr/bin/
	install -D -m755 $startdir/src/sfftobmp3/src/sfftobmp $pkgdir/usr/bin
}
md5sums=('2d93bf32d8f61b7ba37f1c647898401d' '1dd879679b11458a38dce78073cc9ad5')
