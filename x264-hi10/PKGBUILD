# Maintainer	: ShionjiYuuko <zetsurin89@gmail.com>

pkgname=x264-hi10
pkgver=20110729
pkgrel=1
pkgdesc="H.264/MPEG-4 AVC video encoder 10 bit"
arch=('i686' 'x86_64')
url="http://www.videolan.org/developers/x264.html"
license=('GPL')
depends=('glibc')
makedepends=('yasm')
conflicts=('x264')
provides=("x264=$(LANG=C pacman -Si x264 | grep Version | awk '{ print $NF }')") 
source=(ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2)
md5sums=(45307ebec97a1b96fdbe5375f4e2079c)

build() {
	mv $srcdir/x264-snapshot-* "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver/"
	./configure --prefix=/usr --bit-depth=10 --disable-swscale
	make
  
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
