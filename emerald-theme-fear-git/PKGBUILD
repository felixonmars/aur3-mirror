# Maintainer: Thomas Krug <phragment@lavabit.com>
pkgname=emerald-theme-fear-git
pkgver=20110527
pkgrel=1
pkgdesc="Matching Emerald theme"
arch=('any')
url="http://github.com/schuschu/fear"
license=('GPL')
depends=('emerald')
makedepends=('git')

_gitroot="git://github.com/schuschu/fear.git"
_gitname="fear"

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

  # nothing to build
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p ${pkgdir}/usr/share/emerald/themes
  cp -r Emerald/* ${pkgdir}/usr/share/emerald/themes
} 
