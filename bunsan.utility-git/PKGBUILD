# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=bunsan.utility-git
pkgver=20120613
pkgrel=1
pkgdesc="bunsan project utility library"
arch=('i686' 'x86_64')
url="https://github.com/sarum9in/bunsan_utility"
license=('GPL')
groups=()
depends=('bunsan.common-git' 'boost-libs')
makedepends=('git' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

#_gitroot="git://cs.istu.ru/bunsan_utility.git"
_gitroot="git://github.com/sarum9in/bunsan_utility.git"
_gitname="utility"

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

  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make $MAKEFLAGS
}

check() {
  cd "$srcdir/$_gitname-build/build"
  make test
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}
