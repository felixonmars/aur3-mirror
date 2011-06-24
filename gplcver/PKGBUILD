# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Simon Ding <dingsm@gmail.com>

pkgname=gplcver
pkgver=2.12a
pkgrel=2
pkgdesc="Free Verilog simulator with a feature set and performance similar to Verilog-XL"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gplcver/"
license=('GPL2')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.src.tar.bz2/download \
        ${pkgname}.patch)
md5sums=('857a15a9ebc8ef63ece01502509cbeb7'
         '3fd1b9be9b8552916b2a41e7cd245791')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}.src/src
  patch -p0 -i ../../${pkgname}.patch
  if [ `uname -m` = "x86_64" ]; then
    make -f makefile.amd64 cver
  else
    make -f makefile.lnx cver
  fi
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}.src/src
  install -m755 -d ${pkgdir}/usr/share/doc/${pkgname}
  install -m644 -D ../doc/* ${pkgdir}/usr/share/doc/${pkgname}/
  install -m755 -D ../bin/cver ${pkgdir}/usr/bin/cver
}
