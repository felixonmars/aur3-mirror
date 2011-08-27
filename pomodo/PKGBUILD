# Contributor: Ricardo Funke Ormieres <ricardo DOT funke at gmail DOT com>

pkgname=pomodo
pkgver=0.4.5
pkgrel=7
pkgdesc="An Adobe Air application for working with the Pomodoro technique"
arch=('i686' 'x86_64')
url="http://pomodo.areacriacoes.com.br/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://pomodo.areacriacoes.com.br/download/pomodo.air)
md5sums=('69b7bbb005fdfc2302652b6e22dcb5e1')

build()
{
   cd ${srcdir}
   mkdir -p ${pkgdir}/opt/$pkgname
   unzip ${pkgname}.air -d ${srcdir}

   echo "[Desktop Entry]" >> ${srcdir}/${pkgname}.desktop
   echo "Categories=Office;ProjectManagement;" >> ${srcdir}/${pkgname}.desktop
   echo "Comment=$pkgdesc" >> ${srcdir}/${pkgname}.desktop
   echo "Encoding=UTF-8" >> ${srcdir}/${pkgname}.desktop
   echo "Exec=adobe-air /opt/${pkgname}/${pkgname}.air" >> ${srcdir}/${pkgname}.desktop
   echo "GenericName=$pkgname" >> ${srcdir}/${pkgname}.desktop
   echo "Hidden=false" >> ${srcdir}/${pkgname}.desktop
   echo "Icon=${pkgname}.png" >> ${srcdir}/${pkgname}.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${srcdir}/${pkgname}.desktop
   echo "Name=Pomodo" >> ${srcdir}/${pkgname}.desktop
   echo "Terminal=false" >> ${srcdir}/${pkgname}.desktop
   echo "Type=Application" >> ${srcdir}/${pkgname}.desktop

   install -m644 -D ${srcdir}/app/assets/images/icons/128.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
   install -m644 -D ${srcdir}/${pkgname}.air ${startdir}/pkg/opt/${pkgname}/${pkgname}.air
   install -m644 -D ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

