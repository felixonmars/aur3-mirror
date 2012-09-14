# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=yandex.contest.system-git
pkgver=20120912
pkgrel=1
pkgdesc="Yandex.Contest system utilities"
arch=('i686' 'x86_64')
url="https://github.com/sarum9in/yandex_contest_system"
license=('GPL')
groups=()
depends=('boost-libs' 'lxc' 'pkgconfig' 'yandex.contest.common-git')
makedepends=('git' 'boost')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/sarum9in/yandex_contest_system.git"
_gitname="system"

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
  make
}

check() {
  cd "$srcdir/$_gitname-build/build"
  #make test
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}
