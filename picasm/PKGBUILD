# Maintainer: Laszlo Papp <djszapi2@gmail.com>
# Contributor : giacomogiorgianni@gmail.com

pkgname=picasm
pkgver=114
pkgrel=3
pkgdesc="Assembler for the Microchip PIC"
arch=('i686' 'x86_64')
url="http://www.hippy.freeserve.co.uk/picasm.htm"
license=('GPL')
depends=('glibc')
source=(http://www.jmp.fi/~trossi/pic/${pkgname}${pkgver}.tar.bz2)
md5sums=('1048ca05c3b57bb15a5dbd78f272fefa')

build() {
  cd ${srcdir}/${pkgname}${pkgver}
  sed -i 's|-Wall -Wshadow -W -Werror -O2|-Wall -g -O3|' Makefile
  sed -i 's|/usr/local/|/usr/share/|' Makefile
 
  make || return 1
  install -Dm755 ${srcdir}/${pkgname}${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/${pkgname}${pkgver}/${pkgname}.html $pkgdir/usr/share/doc/picasm/${pkgname}.html
  
  install -d "$pkgdir/usr/share/doc/picasm/examples"
  install -Dm644 ${srcdir}/${pkgname}${pkgver}/examples/*.* \
    "$pkgdir/usr/share/doc/picasm/examples"
   

  install -d "$pkgdir/usr/share/picasm/include"
  install -Dm644 ${srcdir}/${pkgname}${pkgver}/device_definitions/*.* \
    "$pkgdir/usr/share/picasm/include"

}

