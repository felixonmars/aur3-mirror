# $Id$
# Maintainer : Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-opencl
pkgname_=ffmpeg
pkgver=2.1
pkgrel=1
epoch=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libtheora' 'libva' 'libvorbis' 'libvpx'
      'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'schroedinger' 'sdl' 'speex'
      'v4l-utils' 'x264' 'xvidcore' 'zlib' 'opencl-headers12'
      )
makedepends=('libvdpau' 'yasm')
source=(http://ffmpeg.org/releases/$pkgname_-$pkgver.tar.bz2)
sha256sums=('940e1bc4f3e185364099b4ba60d4b952615a4232c5641baa3e9f45d4d748130c')
provide=(ffmpeg)
replace=(ffmpeg)
build() {
  cd $pkgname_-$pkgver

  ./configure \
    --prefix=/usr \
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
    --enable-swresample \
    --enable-vdpau \
    --enable-version3 \
    --enable-x11grab \
    --enable-opencl

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd $pkgname_-$pkgver
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}

# vim:set ts=2 sw=2 et:
sha256sums=('926603fd974e9b38071a5cfc6fd0d93857801d1968145dfce7fdc627ab1d68df')
