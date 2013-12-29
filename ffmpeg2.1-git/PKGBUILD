pkgname=ffmpeg2.1-git
pkgver=2.1.1.19.g7eec114
pkgrel=1
pkgdesc='Complete and free Internet live audio and video broadcasting solution'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver")
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'gnutls' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libtheora' 'libva' 'libvorbis' 'libvpx'
      'opencore-amr' 'openjpeg' 'opus' 'rtmpdump' 'schroedinger' 'sdl' 'speex'
      'v4l-utils' 'x264' 'xvidcore' 'zlib'
      )
makedepends=('libvdpau' 'yasm' 'git')
source=(git://git.videolan.org/ffmpeg.git#branch=release/2.1
        ffmpeg-2.1.1-freetype2.patch)
md5sums=('SKIP'
         '4b5dd079a40f44f4e0d00cdbc9d52ec3')

pkgver() {
  cd ffmpeg
  git describe | sed 's/^n//;s/-/./g'
}

prepare() {
  cd ffmpeg
  patch -p1 -i ../ffmpeg-2.1.1-freetype2.patch
}

build() {
  cd ffmpeg

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --enable-avresample \
    --enable-dxva2 \
    --enable-fontconfig \
    --enable-gnutls \
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
    --enable-x11grab

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd ffmpeg
  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir"/usr/bin/qt-faststart
}
