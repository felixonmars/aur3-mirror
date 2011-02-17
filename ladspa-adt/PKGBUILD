# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=ladspa-adt
pkgver=20110215
pkgrel=1
pkgdesc="LADSPA plug-in for emulating the Artificial Double Tracking recording technique "
arch=('i686' 'x86_64')
url="https://github.com/tgh/ADT"
license=('GPL')
groups=('ladspa-plugins')
depends=('ladspa')
makedepends=('git')

_gitroot="git://github.com/tgh/ADT.git"
_gitname="adt"

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

  make
}

package() {
  mkdir -p $pkgdir/usr/lib/ladspa 
  install -Dm755 $srcdir/$_gitname-build/*.so $pkgdir/usr/lib/ladspa
} 
