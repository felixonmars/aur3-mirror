# Maintainer: Tom Wizetek <tom@wizetek.com>
pkgname=realvnc-viewer
pkgver=5.2.1
pkgrel=1
pkgdesc="RealVNC Viewer"
_pkgbin="VNC-Viewer-${pkgver}-linux"
url="http://www.realvnc.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libx11')
 
[[ ${CARCH} = "i686" ]] && _pkgarch="-x86" && source=("${_pkgbin}${_pkgarch}.gz::${url}/download/binary/1615" "${url}/assets/img/logo_48x48.png") && md5sums=('2618cb57995a043da6cc3b2157c65317' '82c145d67bf7821daa52e1c267f93458')
[[ ${CARCH} = "x86_64" ]] && _pkgarch="-x64" && source=("${_pkgbin}${_pkgarch}.gz::${url}/download/binary/1617" "${url}/assets/img/logo_48x48.png") && md5sums=('bfa69c455236bd69ca4663b8a455b971' '82c145d67bf7821daa52e1c267f93458')

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
