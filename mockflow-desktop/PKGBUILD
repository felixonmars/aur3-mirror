# Contributor: Florian Krauthan <fkrauthan@gmx.net>

pkgname=mockflow-desktop
pkgver=0.1
pkgrel=1
pkgdesc="MockFlow Wireframe app."
arch=(i686 x86_64)
url="http://www.mockflow.com/desktop/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://www.mockflow.com/desktop/MockFlow-Desktop.air)
md5sums=('7eab9470b57485e5d4bbaaea5a1ea1a8')
noextract=(MockFlow-Desktop.air)

build()
{
   cd ${startdir}/src
   mkdir -p ${startdir}/pkg/opt/mockflow-desktop
   
   unzip -o MockFlow-Desktop.air -d ${startdir}/src

   cp MockFlow-Desktop.air ${startdir}/pkg/opt/mockflow-desktop

   echo "[Desktop Entry]" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Categories=Application;Development;" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Comment=MockFlow Wireframe app" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Encoding=UTF-8" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Exec=adobe-air /opt/mockflow-desktop/MockFlow-Desktop.air" >> ${startdir}/src/mockflow-desktop.desktop
   echo "GenericName=MockFlow Desktop" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Hidden=false" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Icon=mockflow-desktop.png" >> ${startdir}/src/mockflow-desktop.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Name=MockFlow-Desktop" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Terminal=false" >> ${startdir}/src/mockflow-desktop.desktop
   echo "Type=Application" >> ${startdir}/src/mockflow-desktop.desktop

   install -m644 -D ${startdir}/src/assets/appicons/icon48x48.png ${startdir}/pkg/usr/share/pixmaps/mockflow-desktop.png
   install -m644 -D ${startdir}/src/MockFlow-Desktop.air ${startdir}/pkg/opt/mockflow-desktop

   install -m644 -D ${startdir}/src/mockflow-desktop.desktop ${startdir}/pkg/usr/share/applications/mockflow-desktop.desktop
}

