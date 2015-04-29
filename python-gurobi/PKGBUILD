# Maintainer: gok <gok@openmailbox.org>
# Contributor: Marcos Raimundo <marcosmrai@gmail.com>

# Before building this PKGBUILD, you must download the Gurobi Optimizer
# archive at http://www.gurobi.com/download/gurobi-optimizer and put it
# in the same directory as this PKGBUILD. Registration at gurobi.com is
# required, though free of charge, to be able to download the archive.

pkgname=python-gurobi
_basename=gurobi
pkgver=6.0.3
pkgrel=1
pkgdesc="Python 3 programming interface support for Gurobi Optimizer"
arch=('x86_64')
url="http://www.gurobi.com/products/gurobi-optimizer/gurobi-overview"
license=('custom')
depends=('gurobi' 'python>=3.2' 'python<3.5')
source=(
  "${_basename}${pkgver}_linux64.tar.gz::file://${_basename}${pkgver}_linux64.tar.gz"
  "gurobi-python3.sh"
)
sha256sums=('ff02434767f67674d3a1125db9c70d86ff386e794c5ea615fef6ec65d9572f89'
	    '08c7248c27348f4f987604749f45419a671c1634ed51637a5c3b795831d1566a')

package() {
  cd "$srcdir/${_basename}${pkgver//./}/linux64/"

  install -D ${srcdir}/gurobi-python3.sh "${pkgdir}/usr/bin/gurobi-python3.sh"
  python3 setup.py install --root="$pkgdir" --optimize=1
}
