# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=pycangjie-git
pkgver=1.0
pkgrel=2
pkgdesc="This is a Python wrapper to libcangjie, the library implementing Cangjie and Quick input methods."
arch=(any)
url="https://github.com/Cangjians/pycangjie"
license=('(L)GPL3')
depends=('libcangjie-git' 'python>=3.2')
makedepends=('git' 'autoconf' 'cython>=0.14')
replaces=('pycangjie')
sha1sums=('SKIP')
_gitroot="git://github.com/Cangjians/pycangjie.git"
_gitname="pycangjie"

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
