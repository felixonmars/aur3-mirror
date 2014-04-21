# Contributor: said
# Script updated by: Ḷḷumex03

pkgname=music-download-center
_pkgname=musicdownloadcenter
pkgver=0.5
pkgrel=1
pkgdesc="Music Download Center is a Software to Search and Download Music, to Browse the Internet and to listen Radio."
arch=('i386' 'i686')
url="http://musicdc.sourceforge.net/"
license=('GPL')
makedepends=('deb2targz')
source=(http://skylink.dl.sourceforge.net/project/musicdc/Version%200.5/mdc_${pkgver}-1_i386.deb ${_pkgname}.png ${_pkgname}.desktop)


build() {
  cd ${startdir}/src
  deb2targz mdc_${pkgver}_i386.deb
  tar xzvf mdc_${pkgver}_i386.tar.gz
  cd usr/local/bin
  mkdir -p ${pkgdir}/usr/share/
  cp -r 'Music Download Center' ${pkgdir}/usr/share/
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/'Music Download Center'/'Music Download Center' ${pkgdir}/usr/bin/${_pkgname}
  
  install -Dm644 ${startdir}/src/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -Dm644 ${startdir}/src/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
