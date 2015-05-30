# Maintainer: Your Name <ecolinux@gmx.fr>

pkgname=xmenud
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="A small start menu application"
arch=('any')
url="http://mad.unserver.de/2010/xmonad/xmenud/"
license=('GPL')
groups=()
depends=('pygtk' 'python2-xdg' 'gnome-menus' 'python2')
makedepends=('git')
conflicts=( 'xmenud-git' )
replaces=( 'xmenud-git' )
_gitroot="http://mad.unserver.de/REPOS/${pkgname}.git"
_gitname="$pkgname"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" xmenud.py
  sed -i "s|xdg.Menu.parse()|xdg.Menu.parse(\"/etc/xdg/menus/gnome-applications.menu\")|" xmenud.py
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "$pkgdir/usr/bin/" || return 1
  cp xmenud.py "$pkgdir/usr/bin/xmenud" || return 1
}
