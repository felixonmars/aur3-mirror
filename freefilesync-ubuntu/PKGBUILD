# Allen Choong <allen dot choong at gmail dot com>
pkgname=freefilesync-ubuntu
pkgver=6.0
pkgrel=0
pkgdesc="FreeFileSync Ubuntu, synchronize tool, version 5"
arch=('i686' x86_64)
url="http://sourceforge.net/projects/freefilesync/"
license=('GPLv3')
depends=(wxgtk2.9 boost webkitgtk2)
conflicts=(freefilesync)
source=("http://downloads.sourceforge.net/project/freefilesync/freefilesync/v${pkgver}/FreeFileSync_${pkgver}_Source.zip" FreeFileSync.desktop RealtimeSync.desktop)
md5sums=('8e69bfac44336ad0540345ae3762e616'
         'a8e1363f3b64244fe21184aa93f45506'
         'bf62e7abe1774b120415c794f0c440c2')

build () {
  cd ${srcdir}/FreeFileSync/Source
  sed -i 's/wx-config --/wx-config-2.9 --/' Makefile
  make BUILD=Launchpad
  
  cd RealtimeSync
  sed -i 's/wx-config --/wx-config-2.9 --/' Makefile
  make BUILD=Launchpad
}

package() {
  cd ${srcdir}/FreeFileSync/Source
  make DESTDIR=${pkgdir} install
  
  cd RealtimeSync
  make DESTDIR=${pkgdir} install
  
  cd ${srcdir}
  install -Dm644 FreeFileSync.desktop $pkgdir/usr/share/applications/FreeFileSync.desktop 
  install -Dm644 RealtimeSync.desktop $pkgdir/usr/share/applications/RealtimeSync.desktop 
}
