# Maintainer: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=ffmpeg-shared-git
pkgver=20120827
pkgrel=1
pkgdesc="Record, convert, and stream audio and video with shared libraries enabled"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'custom')
depends=('alsa-lib' 'bzip2' 'faac' 'lame' 'libtheora' 'libva' 'libvdpau' 'libvorbis' 'libxfixes' 'sdl' 'x264-git' 'zlib')
makedepends=('git' 'yasm')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver" "qt-faststart")

_gitroot="git://git.videolan.org/ffmpeg"
_gitname="ffmpeg"

build() {
  cd "$srcdir"
  msg "Connecting to the Git repository..."
  
  if [[ -d "$srcdir/$_gitname" ]] ; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated"
  else
    git clone --depth 1 $_gitroot
  fi
  
  msg "Starting make"
  
  rm -rf "$srcdir/$_gitname-build"
  cp -a "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  
  cd "$srcdir/$_gitname-build"

  ./configure \
    --prefix=/usr \
    --enable-gpl \
    --enable-libfaac \
    --enable-libmp3lame \
    --enable-libtheora \
    --enable-libvorbis \
    --enable-libx264 \
    --enable-nonfree \
    --enable-x11grab \
    --enable-shared
 
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,probe,server}.1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart" 
  rm -rf "$srcdir/$_gitname-build"
}
