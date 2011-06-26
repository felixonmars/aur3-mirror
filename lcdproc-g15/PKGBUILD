# Contributor: MeMi69 <MetalMilitia@gmx.net>
pkgname=lcdproc-g15
pkgver=0.5.4
pkgrel=1
pkgdesc="LCDproc drivers for the g15 lcd."
url="http://lcdproc.omnipotent.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=(lcdproc libg15render g15daemon)
install=$pkgname.install
source=(http://downloads.sourceforge.net/lcdproc/lcdproc-$pkgver.tar.gz)
md5sums=('4d075c3928e84a90bfccf07313b13721')
build() {
  cd $startdir/src/lcdproc-$pkgver
  ./configure --prefix=/usr --enable-drivers=g15 --enable-libusb
  make
  mkdir -p $startdir/pkg/usr/lib/lcdproc
  cp server/drivers/g15.so $startdir/pkg/usr/lib/lcdproc
}
