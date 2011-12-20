# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=fcmake-svn
pkgver=271
pkgrel=2
pkgdesc="fcmake devkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt libssh)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('fcmake')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()

_svntrunk="http://merlin.fit.vutbr.cz/svn/FITkitUtils/trunk"
_svnmod=('fcmake' 'libkitclient' 'fkflash' 'pythonqt' 'qdevkit' 'qdevkit-plugins')

build() {
  cd ${srcdir}
  msg "Retrieaing fcmake from SVN server...."
  
  if [ -d ${_svnmod[0]}/.svn ]; then
  (cd ${_svnmod[0]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[0]} --config-dir ./ -r $pkgver ${_svnmod[0]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make fcmake..."
  
  rm -rf "${_svnmod[0]}-build"
  svn export ${_svnmod[0]} ${_svnmod[0]}-build
  cd ${_svnmod[0]}-build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make
}

package() {
  cd "$srcdir/${_svnmod[0]}-build"
  make DESTDIR="$pkgdir/" install
}
