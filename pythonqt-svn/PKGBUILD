# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=pythonqt-svn
pkgver=271
pkgrel=1
pkgdesc="pythonqt lib for qdevkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt libssh libftdi)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('pythonqt')
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
  msg "Retrieaing pythonqt from SVN server...."
  
  if [ -d ${_svnmod[3]}/.svn ]; then
  (cd ${_svnmod[3]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[3]} --config-dir ./ -r $pkgver ${_svnmod[3]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make pythonqt.."

  rm -rf "${_svnmod[3]}-build"
  svn export ${_svnmod[3]} ${_svnmod[3]}-build
  cd ${_svnmod[3]}-build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make

}

package() {
  cd "$srcdir/${_svnmod[3]}-build"
  make DESTDIR="$pkgdir/" install
}
