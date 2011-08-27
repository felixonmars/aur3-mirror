# Contributor: Marco A Rojas <marquicus at gmail dot com>

pkgname=tda
pkgver=2.2
pkgrel=1
pkgdesc='Java Thread Dump Analyzer'
url='http://java.net/projects/tda'
license=('GPL2')
depends=('java-runtime' 'unzip')
arch=('any')
options=('!strip') 
source=(http://java.net/projects/tda/downloads/download/${pkgname}-bin-${pkgver}.zip tda.patch)
noextract=(${pkgname}-bin-${pkgver}.zip)
md5sums=('a8fd4cd526201232b53f880333d8bc22'
         '15ea2c0cc039eb94c6efd1034715ce3f')

package() {
  cd $pkgdir

  install -dm0755 usr/share/java/${pkgname}/{,doc}
  unzip -q ${srcdir}/${pkgname}-bin-${pkgver}.zip -d usr/share/java/${pkgname}

  rm usr/share/java/${pkgname}/bin/tda.bat
  patch -p0 < ${srcdir}/tda.patch

  install -Dm0755 usr/share/java/${pkgname}/bin/tda.sh usr/bin/tda.sh
}

# End of file
# vim: set ts=2 sw=2 noet: 
