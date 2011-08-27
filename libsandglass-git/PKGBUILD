# Maintainer: Tavian Barnes <tavianator@gmail.com>

pkgname=libsandglass-git
pkgver=20100223
pkgrel=1
pkgdesc="A benchmarking library with clock-cycle resolution."
arch=('i686' 'x86_64')
url="http://www.gitorious.org/libsandglass"
license=('LGPL3')
groups=()
depends=('glibc')
makedepends=()
provides=('libsandglass')
conflicts=('libsandglass')
replaces=()
backup=()
options=('!libtool')
install=
source=()
noextract=()

_gitroot="git://gitorious.org/libsandglass/libsandglass.git"
_gitname="libsandglass"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot || return 1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install || return 1
}
