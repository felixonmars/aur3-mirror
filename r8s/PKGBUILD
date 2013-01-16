# Author:  Stunts <f.pinamartins@gmail.com>

pkgname=r8s
pkgver=1.8
pkgrel=1
pkgdesc="Analysis of rates ("r8s") of evolution"
arch=(i686 x86_64)
license=('Public Domain')
depends=('gcc-libs' 'gcc-fortran')
url="http://loco.biosci.arizona.edu/r8s/"
source=(http://loco.biosci.arizona.edu/r8s/${pkgname}.dist.tgz)
md5sums=('ce39fde6778dfdf9f20442a573c685db')

build() {
  cd "${srcdir}/dist"
  #sed -i 's/FC = g77/FC = gfortran/g' makefile
  #sed -i 's/LIBS =  -lg2c/LIBS =  -lgfortran/g' makefile 
  make -f makefile
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  cp r8s ${pkgdir}/usr/bin/
#  make DESTDIR="${pkgdir}" install || return 1
}
