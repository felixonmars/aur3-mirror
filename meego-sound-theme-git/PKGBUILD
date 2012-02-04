# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sound-theme-git
pkgver=20110219
pkgrel=1
pkgdesc="MeeGo sound theme"
arch=('any')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=()
makedepends=('git')
provides=('meego-sound-theme')
conflicts=('meego-sound-theme')

_gitroot="git://gitorious.org/meego-netbook-ux/meego-sound-theme.git"
_gitname="meego-sound-theme"

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

  install -d ${pkgdir}/usr/share/sounds/meego/stereo
  install -Dm644 index.theme ${pkgdir}/usr/share/sounds/meego/
  cp -r stereo/*.ogg stereo/*.wav ${pkgdir}/usr/share/sounds/meego/stereo
  chmod 644 ${pkgdir}/usr/share/sounds/meego/stereo/*
} 
