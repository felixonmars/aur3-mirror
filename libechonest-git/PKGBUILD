# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>
pkgname=libechonest-git
pkgver=20110215
pkgrel=1
pkgdesc="C++ library for interfacing with Echo Nest"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/libechonest"
license=('GPL')
makedepends=('git')
depends=('qjson')
provides=('libechonest')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/libechonest.git"
_gitname="libechonest"

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
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
        -DCMAKE_BUILD_TYPE=Release \
        .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install
}
