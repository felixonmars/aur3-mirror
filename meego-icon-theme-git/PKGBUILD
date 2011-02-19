# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-icon-theme-git
pkgver=20110219
pkgrel=1
pkgdesc="Base icon theme for MeeGo UX"
arch=('any')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=()
makedepends=('git')
provides=('meego-icon-theme')
conflicts=('meego-icon-theme')
install=meego-icon-theme.install

_gitroot="git://gitorious.org/meego-netbook-ux/meego-icon-theme.git"
_gitname="meego-icon-theme"

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
}

package() {
  cd "$srcdir/$_gitname"

  install -d "${pkgdir}/usr/share/icons/MeeGo UX"
  cp -r netbook/* "${pkgdir}/usr/share/icons/MeeGo UX"
} 
