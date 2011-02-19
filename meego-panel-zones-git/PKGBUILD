# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-panel-zones-git
pkgver=20110219
pkgrel=1
pkgdesc="MeeGo zones panel"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('mutter-meego-git' 'libwnck')
makedepends=('git' 'intltool')
provides=('meego-panel-zones')
conflicts=('meego-panel-zones')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-panel-zones.git"
_gitname="meego-panel-zones"

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

  ./autogen.sh
  ./configure --prefix=/usr \
    --libexec=/usr/lib
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
