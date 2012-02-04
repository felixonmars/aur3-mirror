# Contributor: H.Gökhan SARI <th0th@returnfalse.net>

pkgname=doit.im
pkgver=2.3.19
pkgrel=1
pkgdesc="A powerful, clear and easy yet free task management tool."
arch=('i686' 'x86_64')
url="http://www.doit.im/"
license=('custom')
#depends=('adobe-air')
source=('http://doitim.googlecode.com/files/Doit_for_linux_2_3_19_en.tar.gz' 'doit.png')
md5sums=('fbca6b7aaaa89a1fe061519383fd52cd'
         'fc5558eefc8e61f75c10836ec334aeb3')
options=(!strip)

build()
{
   mkdir -p "$pkgdir/"{"opt","usr/bin"}

   mv "$srcdir/Doit" "$pkgdir/opt/"
   chmod 755 "$pkgdir/opt/Doit"

   echo "[Desktop Entry]" >> $srcdir/doit.desktop
   echo "Categories=Application;Utility;" >> $srcdir/doit.desktop
   echo "Comment=Adobe Air desktop task management application." >> $srcdir/doit.desktop
   echo "Encoding=UTF-8" >> $srcdir/doit.desktop
   echo "Exec=/usr/bin/doit" >> $srcdir/doit.desktop
   echo "GenericName=Doit.im" >> $srcdir/doit.desktop
   echo "Hidden=false" >> $srcdir/doit.desktop
   echo "Icon=doit.png" >> $srcdir/doit.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> $srcdir/doit.desktop
   echo "Name=Doit.im" >> $srcdir/doit.desktop
   echo "Terminal=false" >> $srcdir/doit.desktop
   echo "Type=Application" >> $srcdir/doit.desktop

   install -m644 -D "$startdir/doit.png" "$pkgdir/usr/share/pixmaps/doit.png"

   install -m644 -D "$srcdir/doit.desktop" "$pkgdir/usr/share/applications/doit.desktop"
   
   ln -s "/opt/Doit/doit" "$pkgdir/usr/bin/doit"
}

