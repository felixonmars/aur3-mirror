# Packager: imrahil <hugo_alobo@hotmail.com>

pkgname=obexftp-frontend
pkgver=0.6.6
pkgrel=2
pkgdesc="Java frontend for ObexFTP"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/obexftpfrontend/"
license=('GPL')
source=(http://switch.dl.sourceforge.net/sourceforge/obexftpfrontend/obexftp-frontend-$pkgver-bin.zip phone.png obexftp-frontend.desktop)
depends=('java-runtime' 'obexftp')
md5sums=('d0f00efcea1b683c4617c6fbe5b452a5' 'a8a846d86e6ef8ebb5db9472dbdb360a' '5a6686e8525779a9a7e4326778f13070')

build() {  
  mkdir -p $startdir/pkg/opt/obexftp-frontend/lib
  install -D -m755 $startdir/src/obexftp-frontend-$pkgver-bin/*.* $startdir/pkg/opt/obexftp-frontend/ 
  install -D -m755 $startdir/src/obexftp-frontend-$pkgver-bin/lib/*.jar $startdir/pkg/opt/obexftp-frontend/lib/
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -D -m755 $startdir/phone.png $startdir/pkg/usr/share/pixmaps/
  mkdir -p $startdir/pkg/usr/share/applications
  install -D -m755 $startdir/obexftp-frontend.desktop $startdir/pkg/usr/share/applications/
  
}
