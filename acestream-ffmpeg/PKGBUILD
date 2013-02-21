# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=acestream-ffmpeg
_pkgname=ffmpeg
pkgver=0.10.6
pkgrel=2
epoch=1
pkgdesc="Old ffmpeg libs for use with AceStream, does not conflict with ffmpeg"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL')
depends=('ffmpeg')
makedepends=('yasm' 'libvdpau')
source=(http://ffmpeg.org/releases/$_pkgname-$pkgver.tar.bz2)
md5sums=('30dec94c65ae9a8cec9b950b158abd1c')

build() {
  cd $_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libmp3lame \
    --enable-libvorbis \
    --enable-libxvid \
    --enable-libx264 \
    --enable-libvpx \
    --enable-libtheora \
    --enable-libgsm \
    --enable-libspeex \
    --enable-postproc \
    --enable-shared \
    --enable-x11grab \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libschroedinger \
    --enable-libopenjpeg \
    --enable-librtmp \
    --enable-libpulse \
    --enable-libv4l2 \
    --enable-gpl \
    --enable-version3 \
    --enable-runtime-cpudetect \
    --disable-debug \
    --disable-static

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{bin,include,share}
  rm -r "$pkgdir"/usr/lib/pkgconfig
  rm "$pkgdir"/usr/lib/{libavcodec.so,libavdevice.*,libavfilter.*}
  rm "$pkgdir"/usr/lib/{libavformat.so,libavutil.so,libpostproc.*}
  rm "$pkgdir"/usr/lib/{libswresample.*,libswscale.*}
}
