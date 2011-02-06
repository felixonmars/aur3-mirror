# Contributor: Kristian Setälä <krsetala@gmail.com>
pkgname=libsiilihai-git
pkgver=20100723
pkgrel=1
pkgdesc="A library for writing clients to Siilihai web forum reader service."
arch=('i686' 'x86_64')
url="http://www.siilihai.com/"
license=('GPL3')
depends=('qt')
makedepends=('git')
provides=('libsiilihai')
conflicts=('libsiilihai')

_gitroot="http://github.com/vranki/libsiilihai.git"
_gitname="libsiilihai"

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

  #
  # BUILD HERE
  #

  qmake || return 1
  make INSTALL_ROOT="$pkgdir" install
}
