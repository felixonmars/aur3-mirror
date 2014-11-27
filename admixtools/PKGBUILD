# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=admixtools
pkgver=1.1
realname=release${pkgver}
pkgrel=1
pkgdesc="ADMIXTOOLS (Patterson et al. 2012) is a software package that supports formal tests of whether admixture occurred, and makes it possible to infer admixture proportions and dates."
arch=('x86_64')
url="http://genetics.med.harvard.edu/reich/Reich_Lab/Software.html"
license=('custom')
depends=('gcc')
makedepends=('eigensoft')

source=("http://genetics.med.harvard.edu/reich/Reich_Lab/Software_files/release1.1.tar")
md5sums=('b38462e06f4d10b4e3e804a5581191a2')

build(){
  cd ${srcdir}/${realname}/src
  make dowtjack
  make grabpars
  make qp3Pop
  make qpBound
  make qpDstat
  make qpF4ratio
  make rolloff
}

package() {
  install -Dm755 "${srcdir}/${realname}/src/dowtjack" "${pkgdir}/usr/bin/dowtjack"
  install -Dm755 "${srcdir}/${realname}/src/grabpars" "${pkgdir}/usr/bin/grabpars"
  install -Dm755 "${srcdir}/${realname}/src/qp3Pop" "${pkgdir}/usr/bin/qp3Pop"
  install -Dm755 "${srcdir}/${realname}/src/qpBound" "${pkgdir}/usr/bin/qpBound"
  install -Dm755 "${srcdir}/${realname}/src/qpDstat" "${pkgdir}/usr/bin/qpDstat"
  install -Dm755 "${srcdir}/${realname}/src/qpF4ratio" "${pkgdir}/usr/bin/qpF4ratio"
  install -Dm755 "${srcdir}/${realname}/src/rolloff" "${pkgdir}/usr/bin/rolloff"
}

