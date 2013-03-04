#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=gammaray-git
pkgver=20130304
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'cmake')
depends=(vtk qt4 graphviz)
url='http://www.kdab.com/gammaray'
pkgdesc="GammaRay is a tool to poke around in a Qt-application and also to manipulate the application to some extent"

_gitroot='https://github.com/KDAB/GammaRay.git'
_gitname='GammaRay'
build() {
  cd "$srcdir"
  msg "Connecting to github.com"

  if [ -d "$_gitname" ] ;then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  git checkout master
  mkdir -p build
  cd build

  # force Qt4 build
  cmake  -DCMAKE_INSTALL_PREFIX=/usr -DGAMMARAY_ENFORCE_QT4_BUILD=ON -DQT_QMAKE_EXECUTABLE=qmake-qt4 .. 
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="${pkgdir}" install
}
