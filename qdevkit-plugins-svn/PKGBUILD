# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=qdevkit-plugins-svn
pkgver=271
pkgrel=2
pkgdesc="plugins for qdevkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt qdevkit-svn)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('qdevkit-plugins')
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
  msg "Retrieaing qdevkit-plugins from SVN server...."
  
  if [ -d ${_svnmod[5]}/.svn ]; then
  (cd ${_svnmod[5]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[5]} --config-dir ./ -r $pkgver ${_svnmod[5]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make qdevkit-plugins.."

  rm -rf "${_svnmod[5]}-build"
  svn export ${_svnmod[5]} ${_svnmod[5]}-build
  cd ${_svnmod[5]}-build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make

}

package() {
  cd "$srcdir/${_svnmod[5]}-build"
  make DESTDIR="$pkgdir/" install
}
