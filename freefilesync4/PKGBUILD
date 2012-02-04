# Allen Choong <allen dot choong at gmail dot com>
pkgname=freefilesync4
pkgver=5.0
pkgrel=1
pkgdesc="FreeFileSync, synchronize tool, version 5"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freefilesync/"
license=('GPLv3')
depends=(gtkmm wxgtk boost)
conflicts=(freefilesync)
source=("http://downloads.sourceforge.net/project/freefilesync/freefilesync/v$pkgver/FreeFileSync_v${pkgver}_source.zip" FreeFileSync.desktop parser.h.patch)
md5sums=('6a7f126d11e773f32496dd12724823df'
         'a8e1363f3b64244fe21184aa93f45506'
         '933381d52c46b7d8bb14ce351daa7390')

build () {
  cd ${srcdir}
  patch zenXml/zenxml/parser.h ../parser.h.patch
  make
  make DESTDIR=${pkgdir} install
  install -Dm644 FreeFileSync.desktop $pkgdir/usr/share/applications/FreeFileSync.desktop 
}

