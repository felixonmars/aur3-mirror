# Maintainer	: ShionjiYuuko <zetsurin89@gmail.com>
# Contributor	: kaizoku <animeworldx@gmail.com>

pkgname=x264-snapshot-hi10
pkgver=20111003
pkgrel=1
pkgdesc="H.264/MPEG-4 AVC video encoder 10 bit"
arch=('i686' 'x86_64')
url="http://www.videolan.org/developers/x264.html"
license=('GPL')
depends=('glibc')
makedepends=('yasm')
conflicts=()
#provides=("x264=$(LANG=C pacman -Si x264 | grep Version | awk '{ print $NF }')") 
provides=()
source=(ftp://ftp.videolan.org/pub/x264/snapshots/x264-snapshot-${pkgver}-2245.tar.bz2)
md5sums=('35c5655c5a7ab7649c74a95621879ace')

build() {
	cd "$srcdir/x264-snapshot-$pkgver-2245/"
	./configure --prefix=/usr --bit-depth=10
	make -j 6
}

package() {
	cd "$srcdir/x264-snapshot-$pkgver-2245"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/bin/x264" "$pkgdir/usr/bin/x264-10bit"
}
