# Contributor: Bart Verhoeven <nepherte at archlinux dot us> 
pkgname=libnemesi-git
pkgver=20090501
pkgrel=3
pkgdesc="Implementation of RTSP - Real-Time Streaming Protocol (RFC2326) and RTP/RTCP - Real-Time Transport Protocol/RTP Control Protocol (RFC3550) supporting the RTP Profile for Audio and Video Conferences with Minimal Control (RFC3551)."
arch=('i686' 'x86_64')
url="http://www.lscube.org/projects/libnemesi"
license=('GPL')
depends=('netembryo-git')
makedepends=('git' 'libtool' 'autoconf' 'automake')
provides=('libnemesi=$pkgver')
conflicts=('libnemesi')
source=()
md5sums=()

_gitroot="git://git.lscube.org/libnemesi.git"
_gitname="libnemesi"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."
  
  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  
  cd $srcdir/$_gitname-build

  autoreconf -i

  ./configure || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
