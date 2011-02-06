# Contributor: Kristian Setälä <krsetala@gmail.com>
pkgname=siilihai-client-git
pkgver=20100723
pkgrel=1
pkgdesc="A web forum reader desktop software and a web service."
arch=('i686' 'x86_64')
url="http://www.siilihai.com/"
license=('GPL3')
depends=('libsiilihai-git')
makedepends=('git')
provides=('siilihai-client')
conflicts=('siilihai-client')

_gitroot="http://github.com/vranki/siilihai-client.git"
_gitname="siilihai-client"

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
