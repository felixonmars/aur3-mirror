# Maintainer: spell <mister.lulker at gmail.com>
pkgname=ibus-m17n-git  
pkgver=20110515
pkgrel=1 
pkgdesc="M17N engine for IBus"
url="http://code.google.com/p/ibus/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
makedepends=('git')
conflicts=(ibus-m17n)

_gitroot="git://github.com/phuang/ibus-m17n.git"
_gitname="ibus-m17n"

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

  ./autogen.sh --break-configure || :

  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
