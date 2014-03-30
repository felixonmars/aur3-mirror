# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

githubaccount="PinguinoIDE"
pkgname="pinguino-compilers"
pkgver="2014.03"
pkgrel="1"

pkgdesc="SDCC-pic16 and GCC-mips-elf compilers for pinguino-ide"
arch=("any")
url="http://www.pinguino.cc/"
license=("GPL")

provides=("sdcc=3.3.2")

source="${pkgname}::https://github.com/${githubaccount}/${pkgname}/releases/download/${pkgver}/linux.zip"
md5sums=('c4c580a47de2d335498012957b3e6464')

package() {

  cd ${startdir}
  install -m755 -d ${pkgdir}/usr

  cp -Rv ${srcdir}/linux/p8/* ${pkgdir}/usr/ 
  cp -Rv ${srcdir}/linux/p32/* ${pkgdir}/usr/ 

}
