# Contributor: Chad Davis <archlinux at davtek DOT com>

pkgname=twitterlocal
pkgver=2.0.1
pkgrel=2
pkgdesc="The TwitterLocal AIR Client allows you to watch as many location-based Twitter feeds as you want. "
arch=('i686' 'x86_64')
url="http://www.twitterlocal.net/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=(http://www.twitterlocal.net/TwitterLocal.air)
md5sums=('6d50ade6f6ede48a017ebb4ccd978b16')

build()
{
   cd ${startdir}/src
   mkdir -p ${startdir}/pkg/opt/twitterlocal
   
   unzip TwitterLocal.air -d ${startdir}/src

   cp TwitterLocal.air ${startdir}/pkg/opt/twitterlocal

   echo "[Desktop Entry]" >> ${startdir}/src/twitterlocal.desktop
   echo "Categories=Application;Network;" >> ${startdir}/src/twitterlocal.desktop
   echo "Comment=Adobe Air desktop application that looks to capture the abundance of social media and display it in a unique columned user interface" >> ${startdir}/src/twitterlocal.desktop
   echo "Encoding=UTF-8" >> ${startdir}/src/twitterlocal.desktop
   echo "Exec=adobe-air /opt/twitterlocal/TwitterLocal.air" >> ${startdir}/src/twitterlocal.desktop
   echo "GenericName=twitterlocal" >> ${startdir}/src/twitterlocal.desktop
   echo "Hidden=false" >> ${startdir}/src/twitterlocal.desktop
   echo "Icon=twitterlocal.png" >> ${startdir}/src/twitterlocal.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/twitterlocal.desktop
   echo "Name=twitterlocal" >> ${startdir}/src/twitterlocal.desktop
   echo "Terminal=false" >> ${startdir}/src/twitterlocal.desktop
   echo "Type=Application" >> ${startdir}/src/twitterlocal.desktop

   install -m644 -D ${startdir}/src/icons/icon48.png ${startdir}/pkg/usr/share/pixmaps/twitterlocal.png
   install -m644 -D ${startdir}/src/TwitterLocal.air ${startdir}/pkg/opt/twitterlocal

   install -m644 -D ${startdir}/src/twitterlocal.desktop ${startdir}/pkg/usr/share/applications/twitterlocal.desktop
}

