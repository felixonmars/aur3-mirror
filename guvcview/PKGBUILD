# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=guvcview
pkgver=1.6.1
pkgrel=1
pkgdesc="A video viewer and capturer for the linux uvc driver" 
arch=('i686' 'x86_64')
url="http://guvcview.sourceforge.net/"
license=('GPL')
depends=('portaudio' 'gtk3' 'ffmpeg' 'v4l-utils' 'udev')
makedepends=('pkg-config' 'intltool')
conflicts=('guvcview-svn')
optdepends=('pulseaudio: for PulseAudio support')
source=("http://downloads.sourceforge.net/project/$pkgname/source/$pkgname-src-$pkgver.tar.gz")
md5sums=('b3dfd04d8aae0c807d5f5d6ba035580f')

build() {
	cd "$srcdir/$pkgname-src-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-src-$pkgver"
	make DESTDIR="$pkgdir" install
}
