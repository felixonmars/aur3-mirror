# libOpenSync Plugins Subversion Package
# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=libopensync-plugins-svn
pkgver=3671
pkgrel=1
pkgdesc="Development version of the opensync synchronisation framework plugins"
url="http://www.opensync.org"
license="LGPL"
arch=('i686' 'x86_64')
depends=('glib2' 'libxml2' 'sqlite3' 'libxslt' 'libopensync-svn' 'libsyncml-svn')
makedepends=('subversion' 'cmake' 'python')
options=('!libtool')
replaces=('libopensync-plugins')
conflicts=('libopensync-plugins')
provides=('libopensync-plugins')
source=()
md5sums=()

_svnmod="plugins"
_svntrunk="https://svn.opensync.org/plugins/"

build() {

  cd $startdir/src

  svn co $_svntrunk $_svnmod --config-dir ./ -r $pkgver
    
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  # Plugin evolution2
  cd evolution2
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin file-sync
  cd file-sync
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin gnokii-sync
  cd gnokii-sync
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin google-calendar
#  cd google-calendar
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
#  make || return 1
#  make DESTDIR=$pkgdir install
#  cd ../..

  # Plugin gpe
  cd gpe
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin irmc-sync
  cd irmc-sync
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin kdepim
#  cd kdepim
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
#  make || return 1
#  make DESTDIR=$pkgdir install
#  cd ../..

  # Plugin moto-sync
  cd moto-sync
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin opie-sync
  cd opie-sync
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin palm
  cd palm
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  # Plugin python-module
#  cd python-module
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
#  make || return 1
#  make DESTDIR=$pkgdir install
#  cd ../..

  # Plugin sync4j
#  cd sync4j
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
#  make || return 1
#  make DESTDIR=$pkgdir install
#  cd ../..

  # Plugin syncml
  cd syncml
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR=$pkgdir install
  cd ../..

  rm -rf ../$_svnmod-build

}
