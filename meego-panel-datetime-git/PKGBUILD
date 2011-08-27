# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-panel-datetime-git
pkgver=20110218
pkgrel=1
pkgdesc="MeeGo Date/Time panel"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('meego-panel-myzone-git')
makedepends=('git' 'intltool')
provides=('meego-panel-datetime')
conflicts=('meego-panel-datetime')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-panel-datetime.git"
_gitname="meego-panel-datetime"

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
