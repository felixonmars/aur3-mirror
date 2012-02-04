# Contributor: MrGreen <mrgreen.linuxuser@gmail.com>
pkgname=protoeditor
pkgver=0.9
pkgrel=1
pkgdesc="A small PHP Debugger client"
url="http://protoeditor.sourceforge.net"
license=""
depends=('kdelibs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=protoeditor.install
source=(http://dl.sourceforge.net/sourceforge/protoeditor/$pkgname-$pkgver.tar.gz) 
md5sums=('9b5532d0917dd8b072838a3dfee435b6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
