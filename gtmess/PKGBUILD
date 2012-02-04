# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gtmess
pkgver=0.97
pkgrel=1
pkgdesc="A console MSN Messenger client for Linux and other unix systems that conform to the POSIX standard."
arch=('i686' 'x86_64')
url="http://gtmess.sourceforge.net/"
license=('GPL')
depends=()
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d9526ffd117a22283f477cb15d05807e')

build() {
  cd $startdir/src/gtmess-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
