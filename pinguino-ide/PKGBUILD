# Maintainer: Yeison Cardona <yeison.eng@gmail.com>

githubaccount="PinguinoIDE"
pkgshortname="pinguino"
pkgname="pinguino-ide"
pkgver="11.0.0"
shortver="11.0"
pkgrel="0"
pkgfullver="$pkgver-$pkgrel"
pkggitrelease="v$pkgfullver"
appname="Pinguino IDE development"

installdir="/usr/share/pinguino-11.0"

pkgdesc="Pinguino is a powerful graphic IDE for the development on (Tm)Microchip 8- and 32-bit PIC-based applications."
arch=("i686" "x86_64")
url="http://www.pinguino.cc/"
license=("GPL")

depends=("pinguino-libraries" "pinguino-compilers"
         "python2"
         "python2-pyside" "python2-beautifulsoup4" "python2-pyusb"
         "python2-gitpython" "python2-pysvn")

optdepends=("python2-pyserial" "python2-pyusb" "python2-pynguino")

if test "$CARCH" == x86_64; then
  depends+=("lib32-gcc-libs" "lib32-zlib")
fi

source="${pkgname}::https://github.com/${githubaccount}/${pkgname}/archive/v${pkgver}.zip"
md5sums=('da1ad02d4c00e752e940a1eb1b60e33b')

package() {

  cd ${startdir}
  install -m755 -d ${pkgdir}/${installdir}

  #copying pinguino-ide
  cp -Rvf ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/${installdir}

  cd ${srcdir}
  # write .desktop
  install -m755 -d ${pkgdir}/usr/share/applications/  
  echo "
  [Desktop Entry]
  Version=$pkgver
  Type=Application
  Name=$appname
  Comment=$pkgdesc
  Icon=${installdir}/qtgui/resources/art/windowIcon.svg
  Exec=python2 ${installdir}/pinguino.py
  Path=${installdir}
  Terminal=false
  StartupNotify=false
  Categories=Development;Electronics;Engineering" >> ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # write command launcher
  install -m755 -d ${pkgdir}/usr/bin/ 
  echo "#!/bin/bash" >> ${pkgdir}/usr/bin/${pkgshortname}${shortver}
  echo "python2 ${installdir}/pinguino.py" >> ${pkgdir}/usr/bin/${pkgshortname}${shortver}
  chmod a+x ${pkgdir}/usr/bin/${pkgshortname}${shortver}

}
