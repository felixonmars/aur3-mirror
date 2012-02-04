# Contributor: jisare <jisare@gmail.com>
pkgname=ibus-table-zhengma-git
pkgver=20100902
pkgrel=1
pkgdesc="The zhengma (Chinese) Input Method for IBus Table"
arch=('i686' 'x86_64')
url="http://www.china-e.com.cn/main/zhengma/jj.htm"
license=('GPL')
depends=('ibus-table')
makedepends=('git')
source=()
md5sums=()

_gitroot="http://github.com/acevery/ibus-table-zhengma.git"
_gitname="ibus-table-zhengma"

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
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus \
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
