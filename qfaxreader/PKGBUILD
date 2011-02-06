#Contributor: Serg IanGicher <iangicher@ukr.net>
pkgname=qfaxreader
pkgver=0.3.1
pkgrel=1
pkgdesc="A multipage monochrome/color TIFF/FAX viewer"
url="http://qfaxreader.sourceforge.net"
license="GPL"
depends=('qt' 'libtiff' 'gdbm')
makedepends=(pkgconfig)
conflicts=()
replaces=()
backup=()
install=
source=(http://belnet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/man
  make || return 1
  make DESTDIR=$startdir/pkg install
  
  mkdir -p $startdir/pkg/usr/share/applications
  mkdir -p $startdir/pkg/usr/share/icons/hicolor/16x16/apps
  mkdir -p $startdir/pkg/usr/share/icons/hicolor/22x22/apps
  mkdir -p $startdir/pkg/usr/share/icons/hicolor/32x32/apps
  install -m 644 kde/qfaxreader.desktop $startdir/pkg/usr/share/applications
  install -m 644 kde/icon-16.png $startdir/pkg/usr/share/icons/hicolor/16x16/apps/qfaxreader.png
  install -m 644 kde/icon-22.png $startdir/pkg/usr/share/icons/hicolor/22x22/apps/qfaxreader.png
  install -m 644 kde/icon-32.png $startdir/pkg/usr/share/icons/hicolor/32x32/apps/qfaxreader.png

}
md5sums=('165774433c44f721e82552c866e7be87')



