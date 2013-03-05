#Contributor: onny <onny@project-insanity.org>
#Maintainer: onny <onny@project-insanity.org>

pkgname=opencard
pkgver=1.0.0_pre3
pkgrel=1
pkgdesc="Open eCard-App is an open source alternative of the AusweisApp"
arch=('i686' 'x86_64')
url="https://www.openecard.org"
license=("GPL3")
depends=('java-runtime')
source=("http://openecard.org/download/OpeneCardApp.jar")
sha512sums=('443dad38f17bd7c01779a46b5ea60e24d077d57ab54bcf15918b065a2517f9b18846b9dac1fee3c63ce83a99d97b19da56bb6544d3def37a86f1351dc79feb3e')
package() {
  mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp ${srcdir}/OpenCardApp.jar "${pkgdir}/opt/${pkgname}/"
  echo -e "#!/bin/bash\njava -jar /opt/${pkgname}/OpenCardApp.jar \$@" > $pkgdir/usr/bin/opencard
  chmod a+x "${pkgdir}/usr/bin/opencard"
}
