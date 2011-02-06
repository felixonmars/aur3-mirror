#Maintainer: Dan Serban (dserban01 => gmail)
pkgname=openmolar-bzr
pkgver=336
pkgrel=1
pkgdesc="Open Source Dental Practice Management Software."
arch=('i686' 'x86_64')
url="https://launchpad.net/openmolar"
license=('GPL3')
depends=('python' 'pyqt' 'mysql-python')
optdepends=('mysql: mysql server to store databases')
makedepends=('bzr')
options=()
md5sums=()
install=openmolar.install
_bzrbranch=lp:openmolar/trunk
_bzrmod=trunk

build() {
  cd "${srcdir}"
  msg "Connecting to the server...."

  bzr branch ${_bzrbranch} -q -r ${pkgver}

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  python setup.py install --root="$pkgdir"

}
