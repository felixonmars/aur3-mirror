#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=jrdesktop
pkgver=0.3.1.0
pkgrel=2
pkgdesc="Java cross-platform remote administration client/server, VNC-like."
arch=('i686 x86_64')
license=('GPL3')
url='http://jrdesktop.sf.net'
depends=('java-runtime')
source=("http://downloads.sourceforge.net/jrdesktop/${pkgname}-${pkgver}.jar" "${pkgname}.sh")
md5sums=('931b13602bc416d09a3f8ae095ba9830' 'f44465a401bbc99add0d9f44902a66d3')

build() {
  install -d ${pkgdir}/usr/{bin,share/${pkgname}}
  cd ${srcdir}/
  install -D jrdesktop-0.3.1.0.jar ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/jrdesktop
}
