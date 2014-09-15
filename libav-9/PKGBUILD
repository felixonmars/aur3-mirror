pkgname=libav-9
pkgver=16
pkgrel=1
pkgdesc="Incompatible fork of ffmpeg"
arch=('i686' 'x86_64')
url="http://www.libav.org/"
license=('LGPL')
depends=('alsa-lib' 'bzip2' 'libtheora' 'libvpx' 'x264' 'xvidcore' 'faac' 'lame' 'opus' 'libvorbis' 'freetype2' 'gnutls' 'openssl' 'rtmpdump')
makedepends=('yasm')
provides=('ffmpeg')
conflicts=('ffmpeg' 'libav')
source=(http://libav.org/releases/$pkgname.$pkgver.tar.xz)

prepare() {
  cd "$pkgname.$pkgver"
  sed -i 's|freetype/freetype.h|freetype2/freetype.h|' configure
  sed -i 's|freetype/config/ftheader.h|freetype2/config/ftheader.h|' libavfilter/vf_drawtext.c
}

build() {
  cd "$srcdir/$pkgname.$pkgver"
  ./configure --prefix=/usr --enable-shared --disable-static --disable-debug --enable-gpl --enable-nonfree \
    --enable-libtheora  --enable-libvpx --enable-libx264 --enable-libxvid \
    --enable-libfaac --enable-libmp3lame --enable-libopus --enable-libvorbis \
    --enable-libfreetype --enable-gnutls --enable-openssl --enable-librtmp --enable-x11grab
  make
  make doc/av{play,server,probe}.1
}

package() {
  cd "$srcdir/$pkgname.$pkgver"
  make DESTDIR="$pkgdir/" install install-man
}

# vim:set ts=2 sw=2 et:
md5sums=('7b44b75cec24b8e7545e5029e76917e0')
