# Contributor: Manuel Weber <manuelweber@gmx.at>
# Comments appreciated
pkgname=libdc1394-git
pkgver=20110511
pkgrel=2
pkgdesc="High level programming interface to control IEEE 1394 based cameras"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libraw1394>=2.0.5' 'libusb')
optdepends=('avahi')
makedepends=('git')
provides=('libdc1394')
conflicts=('libdc1394')
options=(!libtool !emptydirs)
url="http://sourceforge.net/projects/libdc1394/"

_gitroot="git://libdc1394.git.sourceforge.net/gitroot/libdc1394/libdc1394"
_gitname="libdc1394-git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/libdc1394"


  #
  autoreconf -i -s
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 

