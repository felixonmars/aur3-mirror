# Maintainer: Ethan Best <kc9ydn@gmail.com>
pkgname=realvnc-viewer-bin
pkgver=5.2.3
pkgrel=1
pkgdesc="RealVNC Viewer"
_pkgbin="VNC-Viewer-${pkgver}-linux"
url="http://www.realvnc.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libx11')

[[ ${CARCH} = "i686" ]] && _pkgarch="-x86" && source=("${_pkgbin}${_pkgarch}::${url}/download/binary/1736" "${url}/assets/img/logo_48x48.png") && md5sums=('0adce65de90507e84c1a54198faa7773' '9100b5eae8bb1c7835cd43f8c1bc0ae6')
[[ ${CARCH} = "x86_64" ]] && _pkgarch="-x64" && source=("${_pkgbin}${_pkgarch}::${url}/download/binary/1738" "${url}/assets/img/logo_48x48.png") && md5sums=('c510f20be76f82e60103bbf8ea6f3b35' '9100b5eae8bb1c7835cd43f8c1bc0ae6')

package() {
install -D -m 755 ${srcdir}/${_pkgbin}${_pkgarch} ${pkgdir}/usr/bin/${pkgname}
install -D -m 644 ${srcdir}/logo_48x48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

cat > ${pkgname}.desktop << EoF
[Desktop Entry]
Type=Application
Categories=Application;Network;
Terminal=false
Exec=/usr/bin/${pkgname}
Icon=/usr/share/pixmaps/${pkgname}.png
Name=RealVNC Viewer
GenericName=Remote desktop client
Comment=Connect to VNC servers
EoF

install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
