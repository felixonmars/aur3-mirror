# Contributor: Lee.MaRS<leemars at gmail.com>
pkgname=ibus-table-wubi-git
pkgver=20120318
pkgrel=1
pkgdesc="The Wubi Input Method of tables engines for IBus."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus/"
license=('LGPL')
depends=('ibus-table>1.2.0')
provides=('ibus-table-wubi=1.2.0')
conflicts=('ibus-table-wubi')
makedepends=('git' 'cvs' 'ibus-table-extraphrase>1.2.0')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://github.com/acevery/ibus-table-wubi.git"
_gitname="ibus-table-wubi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus \
              --enable-wubi86 \
	      --enable-wubi98 \
	      --enable-extra-phrases
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
