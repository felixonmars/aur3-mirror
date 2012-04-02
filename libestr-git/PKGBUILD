# Maintainer: Brian Knox <taotetek at gmail>
# Submitter: Brian Knox <taotetek at gmail>

pkgname=libestr-git
pkgver=20120401
pkgrel=2
pkgdesc="some essentials for string handling (and a bit more)"
arch=('i686' 'x86_64')
url="http://libestr.adiscon.com/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('git make')
conflicts=('libestr')
provides=('libestr')
_gitroot="git://git.adiscon.com/git/libestr.git"
_gitname="libestr"

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ]; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated"
  else
    git clone $_gitroot
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build
}

package() {
  cd "$srcdir/$_gitname-build"
  autoreconf -fvi
  ./configure --prefix=/usr
  make install DESTDIR=${pkgdir}
}
