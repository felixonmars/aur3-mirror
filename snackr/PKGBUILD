# Contributor: Chad Davis <archlinux at davtek DOT com>

pkgname=snackr
pkgver=0.39
pkgrel=1
pkgdesc="It's an RSS ticker that pulls random items from your feeds and scrolls them across your desktop. When you see a title that looks interesting, you can click on it to pop up the item in a window."
arch=(i686 x86_64)
url="http://snackr.net/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://snackr.net/Snackr.air)
md5sums=('32b584a4188e7cf9784bfee055a87e60')

build()
{
   cd ${startdir}/src
   mkdir -p ${startdir}/pkg/opt/snackr
   
   unzip Snackr.air -d ${startdir}/src

   cp Snackr.air ${startdir}/pkg/opt/snackr

   echo "[Desktop Entry]" >> ${startdir}/src/snackr.desktop
   echo "Categories=Application;Network;" >> ${startdir}/src/snackr.desktop
   echo "Comment=An RSS ticker that pulls random items from your feeds and scrolls them across your desktop" >> ${startdir}/src/snackr.desktop
   echo "Encoding=UTF-8" >> ${startdir}/src/snackr.desktop
   echo "Exec=adobe-air /opt/snackr/Snackr.air" >> ${startdir}/src/snackr.desktop
   echo "GenericName=Snackr" >> ${startdir}/src/snackr.desktop
   echo "Hidden=false" >> ${startdir}/src/snackr.desktop
   echo "Icon=snackr.png" >> ${startdir}/src/snackr.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/snackr.desktop
   echo "Name=snackr" >> ${startdir}/src/snackr.desktop
   echo "Terminal=false" >> ${startdir}/src/snackr.desktop
   echo "Type=Application" >> ${startdir}/src/snackr.desktop

   install -m644 -D ${startdir}/src/icons/snackr-icon-flat-48.png ${startdir}/pkg/usr/share/pixmaps/snackr.png
   install -m644 -D ${startdir}/src/Snackr.air ${startdir}/pkg/opt/snackr

   install -m644 -D ${startdir}/src/snackr.desktop ${startdir}/pkg/usr/share/applications/snackr.desktop
}

