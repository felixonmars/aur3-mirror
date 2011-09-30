#Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=gst-chromaprint
pkgver=0.1
pkgrel=1
pkgdesc="Gstreamer extension for chromaprint"
arch=('i686' 'x86_64')
url="http://www.acoustid.org"
license=('GPL2')
depends=('gstreamer0.10' 'chromaprint')
source=($pkgname-$pkgver.tar.gz::https://github.com/lalinsky/gst-chromaprint/tarball/v$pkgver)
md5sums=('f2baf9b8ca05c046b13c36d708f7fa93')

_github=be0924b 

build() {
	cd "$srcdir/lalinsky-$pkgname-$_github"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/lalinsky-$pkgname-$_github"
	make prefix=/usr DESTDIR="$pkgdir/" install
}

