#Contributor: onny <onny@project-insanity.org>
#Maintainer: onny <onny@project-insanity.org>

pkgname=groovedown
pkgver=0.90
pkgrel=4
pkgdesc="Groovedown is a simple Downloadtool for Grooveshark.com"
arch=('i686' 'x86_64')
url="http://groovedown.me"
_watch=('http://groovedown.me','<div id="version">([\d.]*)</div>')
license=("GPL")
depends=('java-runtime')
makedepends=('unzip')
source=("http://groovedown.me/wp-content/uploads/downloads/2013/02/GrooveDown.zip")
sha512sums=('438749a20ae5b87a2d6842f426ca2b41b88a66f4160cb5c20320e04fdcf5adcebd0409d34b544d9a1a13938bf8ccf237be66f510eb7d8db866bb53323008a749')
package() {
  mkdir -p "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  cp ${srcdir}/GrooveDown/gdUpdater.jar ${srcdir}/GrooveDown/GrooveDown.jar "${pkgdir}/opt/${pkgname}/"
  chmod -R 775 "${pkgdir}/opt/${pkgname}"
  echo -e "#!/bin/bash\njava -jar /opt/groovedown/GrooveDown.jar \$@" > $pkgdir/usr/bin/groovedown
  chmod a+x "${pkgdir}/usr/bin/groovedown"
}
