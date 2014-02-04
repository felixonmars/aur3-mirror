# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=python-matplotlib-venn
_upstream_pkgname=matplotlib-venn
pkgver=0.8
pkgrel=1
pkgdesc="Functions for plotting area-proportional two- and three-way Venn diagrams in matplotlib"
arch=('any')
url="https://pypi.python.org/pypi/matplotlib-venn"
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-scipy')
source=(https://pypi.python.org/packages/source/m/matplotlib-venn/${_upstream_pkgname}-${pkgver}.zip)
md5sums=('30b095414983d28077a34b49df32297a')

build() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py build
}

package() {
  cd "${srcdir}/${_upstream_pkgname}-${pkgver}"
  yes | python setup.py install --root="${pkgdir}"
}
