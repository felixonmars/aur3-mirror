# Contributor: ganjolinux aka basalari david <ganjolinux@gmail.com>

pkgname=guiloader
pkgver=2.12.0
pkgrel=1
pkgdesc="A high-performance and compact GuiXml loader library"
arch=('i686')
url="http://crow-designer.sourceforge.net/"
license=('MIT')
depends=('gtk2>=2.10')
makedepends=('pkgconfig>=0.9')
options=('!libtool')
source=(http://downloads.sourceforge.net/crow-designer/$pkgname-$pkgver.tar.bz2)
md5sums=('279854be5d1d7faf73b8e87e3f0a63fe')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-hiddenvisibility
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -m644 -D COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
