# Maintainer: Thomas Krug <phragment@lavabit.com>
pkgname=gtk-theme-fear-git
pkgver=20111101
pkgrel=2
pkgdesc="Matching GTK2 and GTK3 themes"
arch=('any')
url="http://github.com/schuschu/fear"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
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

  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r Fear/ ${pkgdir}/usr/share/themes/
} 
