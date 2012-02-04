# Maintainer: Daniel Kozak kozzi11@gmail.com>
pkgname=libkitclient-svn
pkgver=271
pkgrel=2
pkgdesc="libkitclient devkit utility"
arch=('i686' 'x86_64')
url="http://merlin.fit.vutbr.cz/FITkit/uvod.html"
license=('GPL')
groups=()
depends=(qt libssh libftdi)
makedepends=(subversion cmake qt swig)
optdepends=()
provides=('libkitclient')
conflicts=()
replaces=()
backup=()
options=()
install='libkitclient.install'
changelog=
source=()
noextract=()
md5sums=()

_svntrunk="http://merlin.fit.vutbr.cz/svn/FITkitUtils/trunk"
_svnmod=('fcmake' 'libkitclient' 'fkflash' 'pythonqt' 'qdevkit' 'qdevkit-plugins')

build() {
  cd ${srcdir}
  msg "Retrieaing libkitclient from SVN server...."
  
  if [ -d ${_svnmod[1]}/.svn ]; then
  (cd ${_svnmod[1]} && svn up -r $pkgver)
  else
  svn co ${_svntrunk}/${_svnmod[1]} --config-dir ./ -r $pkgver ${_svnmod[1]}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make libkitclient..."
  
  rm -rf "${_svnmod[1]}-build"
  svn export ${_svnmod[1]} ${_svnmod[1]}-build
  cd ${_svnmod[1]}-build

  sed -i 's/COMMAND python/COMMAND python2/' swig/CMakeLists.txt
  sed -i 's/\/usr\/bin\/env python/\/usr\/bin\/env python2/' swig/test.py
  echo "SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"0403\", ATTRS{idProduct}==\"6010\", GROUP=\"uucp\", MODE=\"0664\"" > contrib/99-libftdi.rules
  cmake -DPYTHON_INCLUDE_PATH=/usr/include/python2.7/ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/
  make

}

package() {
  cd "$srcdir/${_svnmod[1]}-build"
  make DESTDIR="$pkgdir/" install
}
