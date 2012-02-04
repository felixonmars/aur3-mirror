pkgname=orxonox
pkgver=0.0.5
pkgrel=1
pkgdesc="A 3D space action shooter"
arch=('i686' 'x86_64')
url="http://www.orxonox.net/"
license=('GPL')
depends=('ogre' 'cegui-ogre' 'boost' 'lua' 'tcl' 'openal' 'freealut' 'libvorbis' 'zlib')
makedepends=('cmake')
source=(http://svn.orxonox.net/ogre/source_packages/orxonox-0.0.5_src_unix.tar.gz)
md5sums=('fc4c3c425c91bafa21d8e508cd6beb2f')

build() {

  cd orxonox-$pkgver

  msg "Configuring package..."
  if [ ! -d build ]; then
    mkdir build
  fi
  cd build  
  cmake .. -DCMAKE_BUILD_TYPE=Release -DORXONOX_RELEASE=TRUE -DCMAKE_INSTALL_PREFIX=/usr

  msg "Building package..."
  make -j3 || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
