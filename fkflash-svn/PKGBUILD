# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=fkflash-svn
pkgver=271
pkgrel=1
pkgdesc="fkflash qdevkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt libssh libftdi)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('fkflash')
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
  msg "Retrieaing fkflash from SVN server...."
  
  if [ -d ${_svnmod[2]}/.svn ]; then
  (cd ${_svnmod[2]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[2]} --config-dir ./ -r $pkgver ${_svnmod[2]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make fkflash.."

  rm -rf "${_svnmod[2]}-build"
  svn export ${_svnmod[2]} ${_svnmod[2]}-build
  cd ${_svnmod[2]}-build

  sed -i 's/COMMAND python/COMMAND python2/' CMakeLists.txt
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' fkflash.py
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make

}

package() {
  cd "$srcdir/${_svnmod[2]}-build"
  make DESTDIR="$pkgdir/" install
}
