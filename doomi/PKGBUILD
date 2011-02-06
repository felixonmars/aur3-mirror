pkgname=doomi
pkgver=latest
pkgrel=1
pkgdesc="To-do list based on Adobe AIR"
arch=('i686')
url="http://doominow.com/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://doominow.com/Doomi.air)
md5sums=('21560a3470edbe4ac485798ccf7d8377')

build()
{
   cd ${startdir}/src
   mkdir -p ${startdir}/pkg/opt/doomi
   
   unzip -o Doomi.air -d .

   cp Doomi.air ${startdir}/pkg/opt/doomi
   
   echo "[Desktop Entry]" >> ${startdir}/src/doomi.desktop
   echo "Categories=Application;Office;" >> ${startdir}/src/doomi.desktop
   echo "Comment=Adobe Air desktop application that looks to capture the abundance of social media and display it in a unique columned user interface" >> ${startdir}/src/doomi.desktop
   echo "Encoding=UTF-8" >> ${startdir}/src/doomi.desktop
   echo "Exec=adobe-air /opt/doomi/Doomi.air" >> ${startdir}/src/doomi.desktop
   echo "GenericName=doomi" >> ${startdir}/src/doomi.desktop
   echo "Hidden=false" >> ${startdir}/src/doomi.desktop
   echo "Icon=doomi.png" >> ${startdir}/src/doomi.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/doomi.desktop
   echo "Name=doomi" >> ${startdir}/src/doomi.desktop
   echo "Terminal=false" >> ${startdir}/src/doomi.desktop
   echo "Type=Application" >> ${startdir}/src/doomi.desktop

   install -m644 -D ${startdir}/src/icon/128x128.png ${startdir}/pkg/usr/share/pixmaps/doomi.png
   install -m644 -D ${startdir}/src/Doomi.air ${startdir}/pkg/opt/doomi

   install -m644 -D ${startdir}/src/doomi.desktop ${startdir}/pkg/usr/share/applications/doomi.desktop

}


