# Maintainer: Prometheus

pkgname=gee
pkgver=2.2.0
pkgrel=1
pkgdesc="The Global Earthquake Explorer"
arch=('any')
depends=('java-runtime')
url="http://www.seis.sc.edu/gee/"
license=('GPL3')
source=(http://www.seis.sc.edu/downloads/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz)
md5sums=('a96c0e5134340c4cc4a9e93c8e6ccd82')

package() {

mkdir -p $pkgdir/opt/${pkgname}
rsync -av $srcdir/${pkgname}-${pkgver}/ $pkgdir/opt/${pkgname}

if [ -f ${pkgname}.desktop ]
then cat /dev/null > ${pkgname}.desktop
fi

cat >> ${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Exec=/opt/${pkgname}/bin/${pkgname}
Name=GEE
Icon=${pkgname}
GenericName=Global Earthquake Explorer
Comment=${pkgdesc}
Terminal=false
Categories=Education;Science;
EOF

install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -D -m644 "${srcdir}/${pkgname}-${pkgver}/src/main/resources/edu/sc/seis/${pkgname}/data/images/apples/apple1.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
