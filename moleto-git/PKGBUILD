# Maintainer: Petr Kovar <pejuko@gmail.com>

pkgname=moleto-git
pkgver=20130319
pkgrel=1
pkgdesc="Vocabulary learning tool"
arch=(i686 x86_64)
url="https://www.gitorious.org/moleto"
license=('GPL3')
depends=('qt4' 'sqlite')
makedepends=('git')

_gitroot="git://gitorious.org/moleto/moleto.git"
_gitname="moleto.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname/build"
  mkdir -p "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  qmake-qt4 ../moleto.pro
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_gitname/build"
  install -Dm755 moleto "$pkgdir/usr/bin/moleto"
} 
