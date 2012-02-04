# Maintainer: Thanasis Georgiou <sakisds@gmx.com>
pkgname=sds-window-list-git
pkgver=0.2
pkgrel=1
pkgdesc="Adds a window list to gnome-shell."
arch=('any')
url="https://github.com/sakisds/WindowList"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')

_gitroot="git://github.com/sakisds/WindowList.git"
_gitname="WindowList"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/share/gnome-shell/extensions
  mv windowlist@sakisds.gmx.com $pkgdir/usr/share/gnome-shell/extensions
}

