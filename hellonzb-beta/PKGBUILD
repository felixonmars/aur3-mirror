# Maintainer: Prometheus

pkgname=hellonzb-beta
pkgver=1.4
pkgrel=2
pkgdesc="The Binary Usenet Tool"
arch=('any')

if pacman -Qq java-runtime >/dev/null 2>&1; then
  depends=('java-runtime')
elif pacman -Qq jre >/dev/null 2>&1; then
  depends=('jre')
else
  depends=('java-runtime')
fi

url="http://sourceforge.net/projects/hellonzb/"
license=('GPLv2')
noextract=("HelloNzb.jar")
source=(http://kent.dl.sourceforge.net/project/hellonzb/version%20${pkgver}%20beta/${noextract})
md5sums=('dbaf415bee49260b1fbc260319d4c6e7')

package() {

mkdir -p $pkgdir/opt/${pkgname}
cp $startdir/${noextract} "$pkgdir/opt/${pkgname}/."
wget http://sourceforge.net/p/hellonzb//icon?2012-06-19%2022:30:47+00:00 -O ${pkgname}.png

if [ -f ${pkgname}.desktop ]
then cat /dev/null > ${pkgname}.desktop
fi

cat >> ${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Exec=java -jar /opt/${pkgname}/${noextract}
Name=HelloNzb Beta
Icon=${pkgname}
GenericName=${pkgdesc}
Comment=${pkgdesc}
Terminal=false
Categories=Network
EOF

install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
