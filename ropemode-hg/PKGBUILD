# Contributor: Fabián Ezequiel Gallina <fabian@anue.biz>

_pkgname=ropemode
pkgname=${_pkgname}-hg
pkgver=0.1
pkgrel=4
_hgrel=bd969e488130
pkgdesc='Common parts of ropemacs and ropevim.'
arch=('any')
url='http://rope.sourceforge.net/ropemacs.html'
license=('GPL2')
depends=('python2' 'python2-rope')
makedepends=()
source=("https://bitbucket.org/agr/ropemode/get/${_hgrel}.tar.gz")
md5sums=('0f112ad57da141db9467e582e471f869')
install=$pkgname.install
provides=('python-ropemode')
conflicts=('python-ropemode')

build() {
  cd ${srcdir}/agr-${_pkgname}-${_hgrel}
  python2 ./setup.py build
}

package() {
  cd ${srcdir}/agr-${_pkgname}-${_hgrel}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
