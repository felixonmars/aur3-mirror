# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# New Maintainer: Jorge Pizarro Callejas <jpizarro@inf.utfsm.cl>
pkgname=tumblweed
pkgver=2.0.7
pkgrel=1
pkgdesc="Adobe AIR application for Tumblr blogging service"
arch=('i686' 'x86_64')
url="http://www.tumblweed.org"
license=('unknown')
depends=('adobe-air')
source=(http://dmerino.com/tumblweed/tumblweed.air 'tumblweed.sh')
md5sums=('2863130b7779950aa04144fdb36d16d0' \
         '6848fb2fd7a3b542e1e71b2e44b9f40a') 

build() {
  cd $srcdir/
  mkdir $srcdir/tumblweed
  unzip -o tumblweed.air  -d $srcdir/tumblweed
  
  echo "[Desktop Entry]" > ${startdir}/src/tumblweed.desktop
  echo "Categories=Application;Network;" >> ${startdir}/src/tumblweed.desktop
  echo "Comment=Adobe Air desktop client for Tumblr" >> ${startdir}/src/tumblweed.desktop
  echo "Encoding=UTF-8" >> ${startdir}/src/tumblweed.desktop
  echo "Exec=/usr/bin/tumblweed" >> ${startdir}/src/tumblweed.desktop
  echo "GenericName=tumblweed" >> ${startdir}/src/tumblweed.desktop
  echo "Hidden=false" >> ${startdir}/src/tumblweed.desktop
  echo "Icon=tumblweed.png" >> ${startdir}/src/tumblweed.desktop
  echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> ${startdir}/src/tumblweed.desktop
  echo "Name=tumblweed" >> ${startdir}/src/tumblweed.desktop
  echo "Terminal=false" >> ${startdir}/src/tumblweed.desktop
  echo "Type=Application" >> ${startdir}/src/tumblweed.desktop

  
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  install tumblweed.air $pkgdir/opt/$pkgname/
  install -m755 tumblweed.sh $pkgdir/usr/bin/tumblweed
  install -m644 -D $srcdir/tumblweed/AppIconsForAIRPublish/T48.png $pkgdir/usr/share/pixmaps/tumblweed.png
  install -m644 -D $srcdir/tumblweed.desktop $pkgdir/usr/share/applications/tumblweed.desktop
}

# vim:set ts=2 sw=2 et:
