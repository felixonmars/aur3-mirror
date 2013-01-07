# Maintainer: Anselm Helbig <anselm.helbig+aur@googlemail.com>
pkgname=reptyr-git
pkgver=20130107
pkgrel=1
pkgdesc='A tool for "re-ptying" programs'
arch=('i686' 'x86_64')
url="https://github.com/nelhage/reptyr"
license=('MIT')
depends=()
makedepends=('git')
provides=('reptyr')
conflicts=('reptyr')

_gitroot="git://github.com/nelhage/reptyr.git"
_gitname="reptyr"

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

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" PREFIX=/usr install
} 
