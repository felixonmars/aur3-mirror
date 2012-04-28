# Contributor: Fabián Ezequiel Gallina <fabian@anue.biz>

_pkgname=ropemacs
pkgname=${_pkgname}-hg
pkgver=0.6
pkgrel=3
_hgrel=7e2e181c94df
pkgdesc='An emacs minor mode for using rope python refactoring library in emacs.'
arch=('any')
url='http://rope.sourceforge.net/ropemacs.html'
license=('GPL2')
depends=('python2' 'python2-rope' 'ropemode-hg' 'pymacs' 'emacs')
makedepends=()
source=("https://bitbucket.org/agr/ropemacs/get/${_hgrel}.tar.gz")
md5sums=('10fe6112d59579d5bf1fe1d8bca7ae50')
install=$pkgname.install
provides=('ropemacs')
conflicts=('ropemacs')

build() {
  cd ${srcdir}/agr-${_pkgname}-${_hgrel}
  python2 ./setup.py build
}

package() {
  cd ${srcdir}/agr-${_pkgname}-${_hgrel}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
