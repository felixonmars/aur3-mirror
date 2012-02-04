# Contributor: Ricardo Funke Ormieres <ricardo DOT funke at gmail DOT com>

pkgname=focusbooster
pkgver=1.1
pkgrel=4
pkgdesc="Another Adobe Air application for working with the Pomodoro technique"
arch=('i686' 'x86_64')
url="http://www.focusboosterapp.com/"
license=('custom')
[ $CARCH = 'x86_64' ] && depends=('adobe-air' 'lib32-gtk2' 'lib32-libcanberra') || depends=('adobe-air' 'gtk2' 'libcanberra')
makedepends=('unzip')
source=('http://c0300281.cdn.cloudfiles.rackspacecloud.com/Focus%20Booster%201.1.air')
md5sums=('12aca4352396a048119f5535d642b107')

build()
{
   cd ${srcdir}
   mkdir -p ${pkgdir}/opt/$pkgname
   mv 'Focus%20Booster%20'${pkgver}.air ${pkgname}-${pkgver}.air
   unzip ${pkgname}-${pkgver}.air -d ${srcdir}

   echo "[Desktop Entry]" >> ${srcdir}/${pkgname}.desktop
   echo "Categories=Office;ProjectManagement;" >> ${srcdir}/${pkgname}.desktop
   echo "Comment=$pkgdesc" >> ${srcdir}/${pkgname}.desktop
   echo "Encoding=UTF-8" >> ${srcdir}/${pkgname}.desktop
   echo "Exec=adobe-air /opt/${pkgname}/${pkgname}-${pkgver}.air" >> ${srcdir}/${pkgname}.desktop
   echo "GenericName=$pkgname" >> ${srcdir}/${pkgname}.desktop
   echo "Hidden=false" >> ${srcdir}/${pkgname}.desktop
   echo "Icon=${pkgname}.png" >> ${srcdir}/${pkgname}.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${srcdir}/${pkgname}.desktop
   echo "Name=Focus Booster" >> ${srcdir}/${pkgname}.desktop
   echo "Terminal=false" >> ${srcdir}/${pkgname}.desktop
   echo "Type=Application" >> ${srcdir}/${pkgname}.desktop

   install -m644 -D ${srcdir}/assets/icons/fb128.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   install -m644 -D ${srcdir}/${pkgname}-${pkgver}.air ${startdir}/pkg/opt/${pkgname}/${pkgname}-${pkgver}.air
   install -m644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

