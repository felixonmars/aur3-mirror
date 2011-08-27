# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-panel-status-git
pkgver=20110219
pkgrel=1
pkgdesc="MeeGo status panel"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('mutter-meego-git' 'libsocialweb' 'libchamplain' 'geoclue')
makedepends=('git' 'intltool')
provides=('meego-panel-status')
conflicts=('meego-panel-status')
options=('!libtool')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-panel-status.git"
_gitname="meego-panel-status"

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
