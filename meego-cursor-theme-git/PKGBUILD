# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-cursor-theme-git
pkgver=20110218
pkgrel=1
pkgdesc="MeeGo X cursors icon theme"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=()
makedepends=('git' 'xorg-xcursorgen')
provides=('meego-cursor-theme')
conflicts=('meego-cursor-theme')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-cursor-theme.git"
_gitname="meego-cursor-theme"

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

  cd pngs
  ./make.sh
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d ${pkgdir}/usr/share/icons/meego
  cp -r xcursors ${pkgdir}/usr/share/icons/meego/cursors
}
