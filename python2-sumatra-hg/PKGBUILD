# Maintainer: Åsmund Ervik <asmunder at pvv dot org> 

pkgname=python2-sumatra-hg
_hgname=sumatra
pkgrel=1
pkgver=766.9ed1b0b4d4c8
pkgdesc="Sumatra is a tool for managing and tracking projects based on numerical simulation or analysis"
url="http://neuralensemble.org/trac/sumatra/"
arch=('x86_64' 'i686')
license=('CeCILL')
depends=('python2' 'python2-httplib2' 'python2-parameters')
optdepends=('python2-gitpython' 'pysvn-py2')
makedepends=('mercurial')
conflicts=('python2-sumatra')
provides=('sumatra')
source=('hg+https://neuralensemble.org/hg/sumatra')
# Because the sources are not static, skip checksum:
md5sums=('SKIP')

pkgver() {
  cd $_hgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $_hgname
  python2 setup.py build
}

package() {
  cd $_hgname
  python2 setup.py install --skip-build --root=$pkgdir/ --optimize=1
}

