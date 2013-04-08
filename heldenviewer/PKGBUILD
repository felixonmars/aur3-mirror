# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=heldenviewer
pkgver=1.0.4
pkgrel=1
pkgdesc="Program to search, view and download Youtube videos"
arch=('i686' 'x86_64')
url="http://www.heldenviewer.com/cms/index.php/en"
license=('GPL3')
depends=('qt4')
makedepends=('cmake')
source=(http://www.heldenviewer.com/http/downloads/HeldenViewer_src_1_0_4.tar.gz
        $pkgname.desktop)
md5sums=('d5c0ceeb692fa23da91b7465b819de6f'
         '34c42624ba72a9f18c5895c302c2e428')


build() {
   cd $srcdir/HeldenViewer_src_1_0_4

   # GCC 4.7 fix
   sed -i '47i#include <unistd.h>' QtSingleApplication/qtlocalpeer.h
   
   # Build
   cmake .   
   make
}

package() {
   cd $srcdir/HeldenViewer_src_1_0_4

   # Binary
   install -Dm755 HeldenViewer $pkgdir/usr/share/heldenviewer/heldenviewer

   # Executable in path
   install -d $pkgdir/usr/bin
   cat << EOF >> $pkgdir/usr/bin/$pkgname
#!/bin/bash
cd /usr/share/heldenviewer
./heldenviewer
EOF

   chmod +x $pkgdir/usr/bin/$pkgname

   # Translations
   cp HeldenViewer_{de.qm,en.ts} $pkgdir/usr/share/heldenviewer

   # Desktop icon
   cd build/
   install -Dm644 icon.png $pkgdir/usr/share/heldenviewer/icon.png
   install -Dm644 icon.png $pkgdir/usr/share/pixmaps/HeldenViewer.png
   install -Dm644 $srcdir/heldenviewer.desktop $pkgdir/usr/share/applications/heldenviewer.desktop
}