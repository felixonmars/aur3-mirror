# Author:  Stunts <f.pinamartins@gmail.com>

pkgname=r8s
pkgver=1.71
pkgrel=1
pkgdesc="Analysis of rates ("r8s") of evolution"
arch=(i686 x86_64)
license=('Public Domain')
depends=('gcc-libs')
url="http://loco.biosci.arizona.edu/r8s/"
source=(http://loco.biosci.arizona.edu/r8s/${pkgname}${pkgver}.dist.tar.Z)
md5sums=('db250d5eb0b8078e9c08c966836ee1bf')

build() {
  cd "${srcdir}/${pkgname}${pkgver}/src"
  sed -i 's/FC = g77/FC = gfortran/g' Makefile
  sed -i 's/LIBS =  -lg2c/LIBS =  -lgfortran/g' Makefile 
  make || return 1
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  cp r8s ${pkgdir}/usr/bin/
#  make DESTDIR="${pkgdir}" install || return 1
}
