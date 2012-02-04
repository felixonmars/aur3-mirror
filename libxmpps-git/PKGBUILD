# Maintainer: Ramil Farkshatov <ramil@gmx.co.uk>
pkgname=libxmpps-git
pkgver=20110415
pkgrel=1
pkgdesc="Simple XMPP client library."
arch=(i686 x86_64)
url="http://iris-comp.ru/~ramil"
license=('GPL')
depends=('polarssl')
makedepends=('git' '9base')
provides=('libxmpps')
conflicts=('libxmpps')

_gitroot="http://iris-comp.ru/public/git/libxmpps.git"
_gitname="libxmpps"

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

	mk
}

package() {
  cd "$srcdir/$_gitname-build"
  mk destdir="$pkgdir/" install
} 
