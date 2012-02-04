# Maintainer: Dave Reisner <d@falcondiny.com>

pkgname=frexx-cpp-git
pkgver=20110509
pkgrel=1
pkgdesc="a plain and simple ANSI C preprocessor"
arch=('i686' 'x86_64')
url="http://daniel.haxx.se/projects/fcpp/"
license=('BSD')
makedepends=('git')
provides=('frexx-cpp')
conflicts=('frexx-cpp')

_gitroot="git://github.com/bagder/fcpp.git"
_gitname="fcpp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
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

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  install -Dm755 fcpp "$pkgdir/usr/bin/fcpp"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/frexx-cpp/COPYING"
}
