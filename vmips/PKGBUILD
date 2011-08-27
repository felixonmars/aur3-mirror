# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=vmips
pkgver=1.3.2
pkgrel=3
pkgdesc="A virtual machine simulator based on a MIPS R3000 processor"
arch=(i686)
url="http://vmips.sourceforge.net/"
license=('GPL')
depends=('gcc')
makedepends=('perl' 'texinfo' 'tetex')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4d6df5497c5d671da44b7ea58a780ff1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
