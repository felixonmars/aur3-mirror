# Maintainer: Prometheus

pkgname=srt-translator
pkgver=4.1
pkgrel=1
pkgdesc="Subtitle translator from one natural language to other"
arch=('any')
depends=('java-runtime')
url="http://sourceforge.net/projects/srt-tran/"
license=('GPL3')
source=(http://freefr.dl.sourceforge.net/project/srt-tran/v${pkgver}/${pkgname}-linux_v${pkgver}.tar.gz)
md5sums=('ef78b0334549d9902040f257f7eca9b8')

package() {

mkdir -p $pkgdir/opt/${pkgname}
mkdir -p $pkgdir/opt/${pkgname}/dic
mkdir -p $pkgdir/opt/${pkgname}/lib
cp $srcdir/${pkgname}/${pkgname}.jar "$pkgdir/opt/${pkgname}/."
cp $srcdir/${pkgname}/dic/* "$pkgdir/opt/${pkgname}/dic/."
cp $srcdir/${pkgname}/lib/* "$pkgdir/opt/${pkgname}/lib/."

if [ -f ${pkgname}.desktop ]
then cat /dev/null > ${pkgname}.desktop
fi

cat >> ${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Exec=java -jar /opt/${pkgname}/${pkgname}.jar
Name=SRT Translator
Icon=${pkgname}
GenericName=Subtitle translator
Comment=${pkgdesc}
Terminal=false
Categories=Network
EOF

install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -D -m644 "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
