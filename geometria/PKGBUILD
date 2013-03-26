# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geometria
pkgver=3.2.r193
pkgrel=1
pkgdesc="Provides a graphic interface for creating and solving problems in solid geometry."
arch=('any')
depends=('java-runtime' 'bash')
source=(http://www.geocentral.net/geometria/download/Geometria-${pkgver}.zip geometria.desktop Logo.png launch.sh)
md5sums=('bc12dd8c50b1a38155c8663949f7f975'
         'c3557331dc877971dab1169baceb4c3a'
         '5d29d9b6b5fb9d5b6418dc3224a45faf'
         '5e79b4bf8a9c76971d6857c596b28b62')
url="http://www.geocentral.net/geometria/"
license=('GPL')
conflicts=('geometria-fr' 'geometria-en' 'geometria-es')

package() {
  install -d ${pkgdir}/usr/share/{java,applications}
  install -d ${pkgdir}/usr/share/java/$pkgname/
  cp -R lib ${pkgdir}/usr/share/java/$pkgname/
  cp -R samples ${pkgdir}/usr/share/java/$pkgname/
  install -dm777 ${pkgdir}/usr/share/java/$pkgname/logs
  touch ${pkgdir}/usr/share/java/$pkgname/logs/$pkgname.log
  chmod 666 ${pkgdir}/usr/share/java/$pkgname/logs/$pkgname.log
  cp {License.txt,$pkgname.sh} ${pkgdir}/usr/share/java/$pkgname/
  install -Dm644 ${srcdir}/Logo.png ${pkgdir}/usr/share/java/$pkgname/Logo.png
  install -Dm755 ${srcdir}/launch.sh ${pkgdir}/usr/bin/$pkgname
  install -Dm644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop
  chmod o-w $pkgdir/usr/share/java/geometria/logs \
    $pkgdir/usr/share/java/geometria/logs/geometria.log
  chmod +x ${pkgdir}/usr/share/java/$pkgname/geometria.sh
}
