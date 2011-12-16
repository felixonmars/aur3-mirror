# Contributor: Marco A Rojas <marquicus at gmail dot com>

pkgname=jarcomp
pkgver=1
pkgrel=1
pkgdesc="Jarcomp is a comparison tool for Jar files and Zip files. It's free and cross-platform."
url='http://activityworkshop.net/software/jarcomp'
license=('GPL2')
depends=('java-runtime')
arch=('any')
options=('!strip') 
source=(${pkgname}-${pkgver}.jar::http://activityworkshop.net/software/jarcomp/jarcomp_0${pkgver}.jar jarcomp.sh)
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('00053743a7846c08e6b3b79511c9dd8b' '1687ee0ac83a8a901adf031a5f7407ed')

package() {
  cd $pkgdir

  install -dm0755 usr/share/java/${pkgname}/{,doc}
  install -Dm0755 ${srcdir}/${pkgname}-${pkgver}.jar usr/share/java/${pkgname}/${pkgname}.jar

  install -Dm0755 ${srcdir}/jarcomp.sh usr/bin/jarcomp.sh
}

# End of file
# vim: set ts=2 sw=2 noet: 
