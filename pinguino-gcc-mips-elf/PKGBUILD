# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

pkgname="pinguino-gcc-mips-elf"
bitbucketaccount="YeisonEng"

pkgver="4.5.2"
pkgrel="0"
pkgdesc="GCC-mips-elf compilers for pinguino-ide"
arch=("any")
url="http://www.pinguino.cc/"
license=("GPL")

source=("$pkgname::https://bitbucket.org/$bitbucketaccount/pinguino-compilers/downloads/$pkgname.zip")
md5sums=('44119521be60aa64c50615a2c179c288')

package() {

  cd ${startdir}
  install -m755 -d ${pkgdir}/usr

  #moving gcc
  mv -vf ${srcdir}/${pkgname}/* ${pkgdir}/usr/
  
}
