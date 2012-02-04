# Maintainer: Thanasis Georgiou <sakisds@gmx.com>
pkgname=mc-nbt-edit-git
pkgver=0.3
pkgrel=1
pkgdesc="A command line editor for Minecraft's NBT files."
arch=('any')
url="https://github.com/sakisds/mc-nbt-edit"
license=('GPL')
depends=('python' 'python-nbt')
makedepends=('git')

_gitroot="git://github.com/sakisds/mc-nbt-edit.git"
_gitname="mc-nbt-edit"

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
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  mv mc-nbt-edit.py $pkgdir/usr/bin/mc-nbt-edit
}

