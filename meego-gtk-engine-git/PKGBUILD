# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-gtk-engine-git
pkgver=20110219
pkgrel=1
pkgdesc="Gtk engine for MeeGo"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('gtk2')
makedepends=('git')
provides=('meego-gtk-engine')
conflicts=('meego-gtk-engine')
options=('!libtool')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-gtk-engine.git"
_gitname="meego-gtk-engine"

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
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
