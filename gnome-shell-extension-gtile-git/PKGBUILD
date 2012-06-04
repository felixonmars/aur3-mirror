#Maintainer: Juanma Hernandez <juanmah@gmail.com>

pkgname=gnome-shell-extension-gtile-git
pkgver=20120604
pkgrel=1
pkgdesc="A GNOME Shell Extension to tile your windows as you like. It even supports multiscreen"
arch=('any')
url="https://github.com/vibou/vibou.gTile"
license=('none')
#depends=('')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
makedepends=('git' 'gnome-common')

_gitroot=$url
_gitname="gnome-shell-extension-gtile"

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

_extpath="$pkgdir/usr/share/gnome-shell/extensions"
_extname="gTile@vibou"

package() {
  mkdir -p "$_extpath/$_extname"
  cd "$srcdir/$_gitname"
  cp -r * "$_extpath/$_extname"
}

