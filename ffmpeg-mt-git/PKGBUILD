# Mantainer: Samir Faci  <csgeek@esamir.com>   
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=ffmpeg-mt-git
pkgver=20110517
pkgrel=1
pkgdesc="Complete and free Internet live audio and video broadcasting solution for Linux/Unix (Multithread build, git version)"
arch=('i686' 'x86_64')
url="http://gitorious.org/ffmpeg/ffmpeg-mt"
license=('GPL')
depends=('lame' 'sdl' 'libvorbis'  'faac' 'xvidcore' 'zlib' 'x264-git' 'libtheora' 'libvpx>=0.9.1')
makedepends=('git')
provides=("ffmpeg=$pkgver,ffmpeg")
conflicts=('ffmpeg')
source=()
md5sums=()

_gitroot="git://gitorious.org/ffmpeg/ffmpeg-mt.git "
_gitname="ffmpeg-mt"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  
  cd "$srcdir/$_gitname"
  #rm -rf libswscale/
  git submodule init
  git submodule update
  ./configure \
  --prefix=/usr \
  --enable-gpl \
  --enable-libmp3lame \
  --enable-libfaac \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libtheora \
  --enable-postproc \
  --enable-x11grab \
  --arch=`uname -m` \
  --enable-nonfree 
  make 
  make doc/ff{mpeg,play,server}.1 

  make DESTDIR="$pkgdir" install 
  make DESTDIR="$pkgdir" install-man 

}
