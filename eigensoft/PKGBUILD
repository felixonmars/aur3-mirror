# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=eigensoft
pkgver=6.0
realname=EIG${pkgver}beta
pkgrel=1
pkgdesc="The EIGENSOFT package combines functionality from the population genetics methods (Patterson et al. 2006) and the EIGENSTRAT stratification correction method (Price et al. 2006) developed at Harvard Medical School."
arch=('x86_64')
url="http://www.hsph.harvard.edu/alkes-price/software/"
license=('custom')
depends=('gsl')
makedepends=('openblas-lapack')
source=("ftp://pricelab:pricelab@ftp.broadinstitute.org/EIGENSOFT/EIG6.0beta.tar.gz")
md5sums=('78cceb95bf0cd6bb79611e186b61c75f')

build(){
  cd ${srcdir}/${realname}/src
  make baseprog
  make convertf
  make pca 
  make smartpca
  make eigensrc/smartrel
}

package() {
  install -Dm755 "${srcdir}/${realname}/src/baseprog" "${pkgdir}/usr/bin/baseprogs"
  install -Dm755 "${srcdir}/${realname}/src/convertf" "${pkgdir}/usr/bin/convertf"
  install -Dm755 "${srcdir}/${realname}/src/mergeit" "${pkgdir}/usr/bin/mergeit"
  install -Dm755 "${srcdir}/${realname}/src/pca" "${pkgdir}/usr/bin/pca"
  install -Dm755 "${srcdir}/${realname}/src/smartpca" "${pkgdir}/usr/bin/smartpca"
  install -Dm755 "${srcdir}/${realname}/src/eigensrc/smartrel" "${pkgdir}/usr/bin/smartrel"
}

