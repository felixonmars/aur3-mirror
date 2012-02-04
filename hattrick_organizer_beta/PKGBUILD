# Maintainer: Johann Gruendl <johann.gruendlATgmxDOTat>

pkgname=hattrick_organizer_beta
pkgver=1430_r894
_verdir=1.430
_ver=1430
_rel=r894
pkgrel=2
pkgdesc="Hattrick Organizer - A helper tool for online football manager Hattrick (www.hattrick.org)"
arch=('any')
url="http://www.hattrickorganizer.net"
license=(LGPL)
install="${pkgname}.install"
depends=('java-runtime' 'x-server' 'xdg-utils')
# source=(http://downloads.sourceforge.net/project/ho1/ho1/${_verdir}/HO_${_ver}_BETA_${_rel}.zip
source=(http://downloads.sourceforge.net/project/ho1/ho1/${_verdir}/HO_${_ver}_${_rel}.zip
        ${pkgname}.sh
        ${pkgname}.desktop)

md5sums=('60667b327994c5c7499ab759b109f435'
         '178ac9dec905f9be0fc9d0ebb0e3c445'
         'a2fe7f06130cb1172925223c50a0551a')

build() {
cd $srcdir
install -d ${pkgdir}/usr/share/java/${pkgname}
install -m644 *.jar ${pkgdir}/usr/share/java/${pkgname}/
install -m644 *.class ${pkgdir}/usr/share/java/${pkgname}/

install -D -m755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

# Installing the LICENSE
install -D -m644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT
install -D -m644 HO_lgpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/HO_lgpl.txt

# Installing the icon
install -D -m644 ho_logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

cp -R flags hoplugins prediction sprache ${pkgdir}/usr/share/java/${pkgname}/

find "$pkgdir/usr/share/java/$pkgname" -type d -exec chmod 755 '{}' \;
find "$pkgdir/usr/share/java/$pkgname" -type f -exec chmod 644 '{}' \;

# Configuration for Multi-User-Mode/Usage of home-dir
install -D -m755 HO.sh ${pkgdir}/usr/share/java/${pkgname}/HO.sh
echo "HODIR=\"/usr/share/java/${pkgname}\"" >> ${pkgdir}/usr/share/java/${pkgname}/HO.config
echo "HOHOME=\"~/.${pkgname}\"" >> ${pkgdir}/usr/share/java/${pkgname}/HO.config
}