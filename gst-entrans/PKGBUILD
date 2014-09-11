#Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=gst-entrans
pkgver=1.0.2
pkgrel=1
pkgdesc="Gstreamer plugins for transcoding and recording"
arch=('i686' 'x86_64')
url="http://gentrans.sourceforge.net"
license=('LGPL')
depends=('gstreamer' 'gst-plugins-base' 'python2')
optdepends=('gst-plugins-good: for needed codecs'
			'gst-plugins-ugly: for needed codecs'
			'gst-plugins-bad: for needed codecs'
			'gst-libav: for needed codecs')
options=(!libtool)
source=(http://sourceforge.net/projects/gentrans/files/gst-entrans/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('cf47decb0782b29ed38a4cafe6c0b32e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/python/python2/" tools/entrans
	make prefix=/usr DESTDIR="$pkgdir/" install
}

