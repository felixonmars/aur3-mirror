# Maintainer: Jekyll Wu<adaptee [at] gmail [dot com>

pkgname=gnome-shell-extension-ibus-panel
pkgver=20110710
pkgrel=1
pkgdesc="A Gnome Shell extension for ibus panel "
arch=('i686' 'x86_64')
url="https://github.com/tigersoldier/Gnome-Shell-IM-Panel"
license=('GPL')
depends=('ibus-git')
makedepends=('git')
conflicts=('ibus-gjs-git')

_gitroot="git://github.com/tigersoldier/Gnome-Shell-IM-Panel"
_gitname="Gnome-Shell-IM-Panel"

_uuid="gjsimp@tigersoldier"

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

  rm -rf "$srcdir/$_uuid"
  git clone "$srcdir/$_gitname" "$srcdir/$_uuid"
  cd "$srcdir/$_uuid"

  # you do not want to include .git directory in the package
  rm ./.git -rf
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -r "$_uuid"  "$pkgdir/usr/share/gnome-shell/extensions/"
} 
