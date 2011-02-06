pkgname=adler32-git
pkgver=20110204
pkgrel=1
pkgdesc="Simplest possible C implementation of the same-named checksum algorithm"
url="http://doc.manasource.org/tools"
arch=('i686')
license=('GPL')
makedepends=('git')
provides=('adler32')

_gitroot="git://gitorious.org/mana/mana.git"
_gitname="mana"

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
  cd "$srcdir/$_gitname-build"

  cd ./tools
  gcc -o adler32 adler32.c -lz
}

package() {
  cd "$srcdir/$_gitname-build/tools"
  mkdir -p $pkgdir/usr/bin/
  cp ./adler32 $pkgdir/usr/bin/
  chmod 775 $pkgdir/usr/bin/adler32
} 
