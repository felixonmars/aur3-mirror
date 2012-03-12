# Maintainer: Daniel Wallace daniel.wallace@gatech.edu
pkgname=plex-ffmpeg-git
pkgver=20120312
pkgrel=3
pkgdesc="plex fork of ffmpeg"
arch=( 'i686' 'x86_64' )
url="https://github.com/elan/plex-ffmpeg"
license=('GPL')
depends=('alsa-lib' 'bzip2' 'gsm' 'lame' 'libpulse' 'libtheora' 'libva' 'libvorbis' 'libvpx' 'opencore-amr' 'openjpeg' 'rtmpdump' 'schroedinger' 'sdl' 'speex' 'x264' 'xvidcore' 'zlib')
makedepends=('git')
provides=(plex-ffmpeg)
conflicts=(ffmpeg)

_gitroot=https://github.com/gewalker/plex-ffmpeg-linux.git
_gitname=ffmpeg-plex

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

