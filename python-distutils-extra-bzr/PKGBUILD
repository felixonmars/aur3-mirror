# Contributor: Marco Ferragina <marco.ferragina@gmail.com>
pkgname=python-distutils-extra-bzr
pkgver=54
pkgrel=1
pkgdesc="Python distutils enanchement"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/python-distutils-extra"
license=('GPL')
depends=('python' 'intltool')
makedepends=('setuptools' 'bzr')
source=()
md5sums=()

_bzrmod="main"
_bzrtrunk="http://bazaar.launchpad.net/~glatzor/python-distutils-extra/main"

build() {
  cd $startdir/src
  msg "Getting sources..."
  bzr co $_bzrtrunk -r $pkgver

  cd $_bzrmod
  python setup.py install --root=$startdir/pkg
}
