# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

githubaccount="PinguinoIDE"
pkgname="pinguino-libraries"
pkgver="2014.02"
pkgrel="1"

installdir="/usr/share/pinguino-11.0"

pkgdesc="Pinguino's libraries and examples for (Tm)Microchip 8- and 32-bit PIC-based applications"
arch=("any")
url="http://www.pinguino.cc/"
license=("GPL")

source="${pkgname}::https://github.com/${githubaccount}/${pkgname}/archive/${pkgver}.zip"
md5sums=('51d179cb402e6966292ca978080eebd1')

options=("staticlibs")

package() {

  cd ${startdir}
  install -m755 -d ${pkgdir}/${installdir}

  mv -v ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/${installdir}
  rm ${pkgdir}/${installdir}/{README.md,LICENSE}

}
