# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname='ffmpeg-libaacplus'
_name='ffmpeg'
conflicts='ffmpeg'
provides='ffmpeg'
pkgver=2.0
pkgrel=1
epoch=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix with libaacplus support"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'LGPL' '3GPP')
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libtheora' 'libva' 'libvorbis' 'libvpx'
      'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'schroedinger' 'sdl' 'speex'
      'v4l-utils' 'x264' 'xvidcore' 'zlib' 'libaacplus'
      )
makedepends=('libvdpau' 'yasm')
source=(http://ffmpeg.org/releases/$_name-$pkgver.tar.bz2)
sha256sums=('940e1bc4f3e185364099b4ba60d4b952615a4232c5641baa3e9f45d4d748130c')

[[ "$CARCH" == i686 ]] && _asm='--disable-asm'

build() {
  cd $_name-$pkgver

  ./configure \
    --prefix=/usr \
    $_asm \
    --disable-debug \
    --disable-static \
    --enable-avresample \
    --enable-dxva2 \
    --enable-fontconfig \
    --enable-gpl \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libgsm \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libxvid \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpudetect \
    --enable-shared \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --enable-libaacplus \
    --enable-nonfree

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd $_name-$pkgver
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}
