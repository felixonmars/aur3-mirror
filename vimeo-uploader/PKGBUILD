# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>

pkgname=vimeo-uploader
pkgver=0.1
pkgrel=2
pkgdesc="Vimeo Desktop Uploader"
arch=('any')
url="http://www.vimeo.com"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=('http://vimeo.com/assets/air/desktopuploader/VimeoUploader.air')
md5sums=('ff42afd33a4430d525858474ca823e29')

build()
{
   cd $srcdir
   mkdir -p $pkgdir/opt/vimeo-uploader
   
   unzip VimeoUploader.air -d $srcdir

   cp VimeoUploader.air $pkgdir/opt/vimeo-uploader/

   echo "[Desktop Entry]" >> $srcdir/vimeo-uploader.desktop
   echo "Categories=Application;Network;" >> $srcdir/vimeo-uploader.desktop
   echo "Comment=Adobe Air desktop task management application." >> $srcdir/vimeo-uploader.desktop
   echo "Encoding=UTF-8" >> $srcdir/vimeo-uploader.desktop
   echo "Exec=adobe-air /opt/vimeo-uploader/VimeoUploader.air" >> $srcdir/vimeo-uploader.desktop
   echo "GenericName=Vimeo Uploader" >> $srcdir/vimeo-uploader.desktop
   echo "Hidden=false" >> $srcdir/vimeo-uploader.desktop
   echo "Icon=vimeo-uploader.png" >> $srcdir/vimeo-uploader.desktop
   echo "MimeType=application/vnd.adobe.air-application-installer-package+zip" >> $srcdir/vimeo-uploader.desktop
   echo "Name=Vimeo Uploader" >> $srcdir/vimeo-uploader.desktop
   echo "Terminal=false" >> $srcdir/vimeo-uploader.desktop
   echo "Type=Application" >> $srcdir/vimeo-uploader.desktop

   install -m644 -D $srcdir/deploy/icons/48.png $pkgdir/usr/share/pixmaps/vimeo-uploader.png
   install -m644 -D $srcdir/VimeoUploader.air $pkgdir/opt/vimeo-uploader/

   install -m644 -D $srcdir/vimeo-uploader.desktop $pkgdir/usr/share/applications/vimeo-uploader.desktop
}

