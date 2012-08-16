pkgname=mantiukhdr
pkgver=0.3.9
pkgrel=2
pkgdesc="A shell script that uses the Mantiuk and Fattal algorithms to create HDR images."
arch=('i686' 'x86_64')
url="http://mantiukhdr.sourceforge.net/"
license=('ISC')
depends=('pfstools' 'pfstmo' 'enblend-enfuse' 'hugin' 'imagemagick' 'sed' 'bc')
optdepends=('dcraw')
source=(http://downloads.sourceforge.net/project/mantiukhdr/$pkgname)
md5sums=('8fa957cbec42e676b3f60fe1994a758c')

build() {
  cd ${srcdir}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
