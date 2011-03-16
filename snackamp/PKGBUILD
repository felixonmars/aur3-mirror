# Contributor: wain <wain at archlinux dot fr>
# Maintainer: kfgz <kfgz at interia dot pl>

pkgname=snackamp
pkgver=3.1.3
pkgrel=1
pkgdesc="music player with poweful feature and integrated web server (beta)"
url="http://snackamp.sourceforge.net/"
license=('GPL')
depends=('metakit' 'tk' 'libxext')
arch=('i686' 'x86_64')
conflicts=('snackamp-beta')
source=(http://snackamp.sourceforge.net/releases/snackAmp-${pkgver}.i386.tar.gz)
md5sums=('a039da25b87e649087940bf3e0249252')

package() {
  install -d ${pkgdir}/usr/share/snackamp/
  install -m 755 ${srcdir}/linux/* ${pkgdir}/usr/share/snackamp/
  install -d ${pkgdir}/usr/bin 
  echo '#!/bin/bash' > ${pkgdir}/usr/bin/snackamp 
  echo 'cd /usr/share/snackamp/ && ./snackAmp' >> ${pkgdir}/usr/bin/snackamp
  chmod +x ${pkgdir}/usr/bin/snackamp
}
