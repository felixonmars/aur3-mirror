# Maintainer: hi117
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=libav-git
_gitname=libav
pkgver=v9.1092.g20784aa
pkgrel=2
pkgdesc="FFmpeg fork"
arch=('i686' 'x86_64')
url="http://libav.org/"
license=('GPL')
depends=('alsa-lib' 'bzip2' 'faac' 'lame' 'libtheora' 'libva' 'libvdpau' 'libvorbis' 'libvpx' 'libxfixes' 'sdl' 'x264-git' 'zlib')
makedepends=('git' 'yasm' 'perl')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver")
source=("git://git.libav.org/libav.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/$_gitname

  ./configure \
    --prefix=/usr \
    --enable-gpl \
    --enable-libfaac \
    --enable-libmp3lame \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-nonfree \
    --enable-vaapi \
    --enable-vdpau \
    --enable-x11grab
 
  make
  make doc/av{conv,play,probe,server}.1
}

package() {
  cd "$srcdir"/$_gitname 
  make DESTDIR="$pkgdir" install install-man
}
