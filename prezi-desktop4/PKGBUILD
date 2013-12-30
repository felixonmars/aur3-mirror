# Maintainer: Robert Orzanna <orschiro@gmail.com>"

pkgname='prezi-desktop4'
_pkgname='prezi-desktop'
pkgver=4.6
license=('custom')
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Prezi Desktop is a presentation software giving you all the power of Prezi without needing an internet connection."
url=('https://prezi.com/desktop/')
source=("https://googledrive.com/host/0B5L61s7LfvFNY1hXNXNMQkZ2eEk/PreziDesktop_4.6.zip" 'prezi-desktop.desktop')
noextract=("PreziDesktop_$pkgver.zip")
conflicts=('prezi-desktop')
depends=('bash' 'adobe-air-sdk' 'unzip')
md5sums=('4b1cbb4e60efe98d53b1721711e67cd0'
         '3788a65f1ff115eec79d3b32038ad8a4')

package() {
  cd "${srcdir}"
  mkdir "${pkgdir}"/opt/
  mkdir "${pkgdir}"/opt/airapps
  mkdir "${pkgdir}"/usr/
  mkdir "${pkgdir}"/usr/bin
  install "${srcdir}"/PreziDesktop_$pkgver.zip  "${pkgdir}"/opt/airapps/prezi-desktop.zip
  mkdir "${pkgdir}"/opt/airapps/prezi-desktop
  cd "${pkgdir}"/opt/airapps/prezi-desktop
  unzip ../prezi-desktop.zip
  echo "#!/bin/bash" >>"${pkgdir}"/usr/bin/prezi-desktop
  echo "/opt/adobe-air-sdk/bin/adl -nodebug /opt/airapps/prezi-desktop/META-INF/AIR/application.xml /opt/airapps/prezi-desktop/" >> "${pkgdir}"/usr/bin/prezi-desktop
  chmod +x "${pkgdir}"/usr/bin/prezi-desktop
  mkdir -p "${pkgdir}"/usr/share/applications
  install "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/ 
}
