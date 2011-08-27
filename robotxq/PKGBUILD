# Contributor: gucong <gucong43216@gmail.com>
pkgname=robotxq
pkgver=20110720
pkgrel=2
pkgdesc="Robot plays Xiangqi"
arch=('i686' 'x86_64')
url="http://github.com/gucong/robotxq"
license=('GPL')
depends=()
makedepends=('git' 'texlive-core' 'ttf-ms-fonts-zh_cn')
source=()
md5sums=()

_gitroot="http://github.com/gucong/robotxq.git"
_gitname="robotxq"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
