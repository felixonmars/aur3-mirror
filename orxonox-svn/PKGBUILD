pkgname=orxonox-svn
pkgver=8439
pkgrel=1
pkgdesc="A 3D space action shooter"
arch=('i686' 'x86_64')
url="http://www.orxonox.net/"
license=('GPL')
depends=('ogre' 'cegui-ogre' 'boost' 'lua' 'tcl' 'openal' 'freealut' 'libvorbis' 'zlib')
makedepends=('subversion' 'cmake')
provides=('orxonox')
conflicts=('orxonox')
md5sums=()

_svntrunk=http://svn.orxonox.net/game/code/trunk
_svnmod=orxonox

_svndatatrunk=http://svn.orxonox.net/game/data/trunk
_svndatamod=data_extern

build() {

  msg "Checking out code repository..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
  else
    svn co ${_svntrunk} ${_svnmod}
  fi

  msg "Checking out data repository..."
  if [ -d ${_svndatamod}/.svn ]; then
    (cd ${_svndatamod} && svn up)
  else
    svn co ${_svndatatrunk} ${_svndatamod}
  fi

  msg "Configuring package..."
  cd ${_svnmod}
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build  
  cmake .. -DCMAKE_BUILD_TYPE=Release -DORXONOX_RELEASE=TRUE -DCMAKE_INSTALL_PREFIX=/usr

  msg "Building package..."
  make -j3 || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
