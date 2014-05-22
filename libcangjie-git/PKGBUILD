# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=libcangjie-git
pkgver=1.0
pkgrel=1
pkgdesc="CangJie Input Method Library"
arch=(any)
url="https://github.com/Cangjians/libcangjie"
license=('(L)GPL3')
depends=('sqlite')
makedepends=('git' 'autoconf' 'gcc' 'glibc pkg-config')  
replaces=('libcangjie')
sha1sums=('SKIP')
_gitroot="git://github.com/Cangjians/libcangjie.git"
_gitname="libcangjie"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $gitname
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure prefix=/usr
  make
}

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
