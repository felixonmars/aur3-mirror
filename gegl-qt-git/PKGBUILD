# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=gegl-qt
pkgname=$_pkgname-git
pkgver=20110928
pkgrel=1
pkgdesc="Convenience library for using GEGL in Qt applications" 
arch=(i686 x86_64)
url="http://www.gegl.org"
license=('LGPLv3+')
depends=('gegl' 'qt' 'python2' 'pyside' 'pygobject2-devel' 'doxygen')
# pyside, python2, pygobject2-devel: for python bindings
# doxygen: for documentation
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://git.gnome.org/gegl-qt"
_gitname="gegl-qt"

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

  # BUILD
  export PYTHON=/usr/bin/python2
  qmake -r
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make INSTALL_ROOT="$pkgdir/" install
} 
