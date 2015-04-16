# Maintainer: toerb

pkgname=ffmpeg-nox
pkgver=r61760.9456a86
pkgrel=1
pkgdesc="Universal multimedia toolkit - no X11 or Waylands dependencies."
arch=('i686' 'x86_64')
license=('GPL')
url="http://ffmpeg.org/"
license=('GPL')
depends=('bzip2' 'libtheora' 'libvpx' 'libx264' 'zlib' 'libvorbis' 'opus' 'libfdk-aac' 'lame')
makedepends=('git' 'yasm')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver" "qt-faststart")
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	./configure \
		--prefix=/usr \
		--disable-static \
		--disable-ffplay \
		--disable-xlib \
		--disable-dxva2 \
		--disable-vaapi \
		--disable-vda \
		--disable-vdpau \
		--disable-outdevs \
		--disable-indevs \
		--enable-gpl \
		--enable-libfdk-aac \
		--enable-libmp3lame \
		--enable-libopus \
		--enable-libtheora \
		--enable-libvorbis \
		--enable-libvpx \
		--enable-libx264 \
		--enable-nonfree \
		--enable-shared 

	make
	make tools/qt-faststart
	make doc
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install install-man
	install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}

