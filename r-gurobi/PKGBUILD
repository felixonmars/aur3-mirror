# Maintainer: gok <gok@openmailbox.org>
# Contributor: Marcos Raimundo <marcosmrai@gmail.com>

# Before building this PKGBUILD, you must download the Gurobi Optimizer
# archive at http://www.gurobi.com/download/gurobi-optimizer and put it
# in the same directory as this PKGBUILD. Registration at gurobi.com is
# required, though free of charge, to be able to download the archive.

pkgname=r-gurobi
_basename=gurobi
pkgver=6.0.3
pkgrel=1
pkgdesc="R programming interface support for Gurobi Optimizer, supports R 3.0.0 to 3.0.3"
arch=('x86_64')
url="http://www.gurobi.com/products/gurobi-optimizer/gurobi-overview"
license=('custom')
# TODO: enforce R version requirements
depends=('gurobi' 'r')
source=("${_basename}${pkgver}_linux64.tar.gz::file://${_basename}${pkgver}_linux64.tar.gz")
sha256sums=('ff02434767f67674d3a1125db9c70d86ff386e794c5ea615fef6ec65d9572f89')

package() {
  cd "$srcdir/${_basename}${pkgver//./}/linux64/"

  install -d "${pkgdir}/usr/lib/R/library/"
  R CMD INSTALL -l "${pkgdir}/usr/lib/R/library/" \
          R/${_basename}_6.0-3_R_${arch}-unknown-linux-gnu.tar.gz
}
