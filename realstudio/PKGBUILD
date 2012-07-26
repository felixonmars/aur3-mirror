# Maintainer: Ng Oon-Ee <n g  o o n  e e AT g m a i l DOT c o m>
# Contributor: Leonardo Miliani <leonardo at leonardomiliani.com>
pkgname=realstudio
pkgver=2011r43
pkgrel=1
pkgdesc="A RAD environment based on BASIC that compiles native applications for Windows, Mac and Linux."
arch=('i686' 'x86_64')
url="http://www.realsoftware.com"
license=('custom')
depends=()
optdepends=('cups: For printing support'
            'libgtkhtml: Render webpages in the built-in HTML Viewer'
            'lib32-libgtkhtml: Render webpages in the built-in HTML Viewer on multilib install')
install=${pkgname}.install
source=(http://realsoftware.cachefly.net/RealStudio${pkgver}/RealStudio${pkgver}.tgz realstudio.desktop)
md5sums=('666ae634fe8e7ad7ba2f7da0adad9bf2'
         'e51ad6593c387d991c29a2059b1053c7')
_srcdirname="RealStudio2011r4.3"

if [[ $CARCH == i686 ]]; then
  depends+=(gtk2 expat glib2 mesa)
else
  depends+=(lib32-gtk2 lib32-expat lib32-glib2 lib32-mesa)
fi
         
package() {
	install -dv -m755 ${pkgdir}/opt/realsoftware/RealStudio-${pkgver}
  cp -a ${srcdir}/${_srcdirname}/* ${pkgdir}/opt/realsoftware/RealStudio-${pkgver}
  
  install -Dv -m644 "${srcdir}/${_srcdirname}/Read Mes/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"

  install -Dv -m644 ${srcdir}/${_srcdirname}/realstudio.xpm ${pkgdir}/usr/share/pixmaps/realstudio.xpm

  install -Dv -m644 ${srcdir}/realstudio.desktop ${pkgdir}/usr/share/applications/realstudio.desktop

  install -dv -m755 ${pkgdir}/usr/bin
  ln -s "/opt/realsoftware/RealStudio-${pkgver}/Real Studio 2011" ${pkgdir}/usr/bin/realstudio
}
