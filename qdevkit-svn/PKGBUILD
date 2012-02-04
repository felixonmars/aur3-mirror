# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=qdevkit-svn
pkgver=271
pkgrel=2
pkgdesc="qdevkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt libssh libftdi fcmake-svn libkitclient-svn pythonqt-svn)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('qdevkit')
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
  msg "Retrieaing qdevkit from SVN server...."
  
  if [ -d ${_svnmod[4]}/.svn ]; then
  (cd ${_svnmod[4]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[4]} --config-dir ./ -r $pkgver ${_svnmod[4]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make qdevkit.."

  rm -rf "${_svnmod[4]}-build"
  svn export ${_svnmod[4]} ${_svnmod[4]}-build
  cd ${_svnmod[4]}-build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make

}

package() {
  cd "$srcdir/${_svnmod[4]}-build"
  make DESTDIR="$pkgdir/" install
}
