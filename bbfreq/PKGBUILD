# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=bbfreq
pkgver=0.1.1
pkgrel=1
pkgdesc="Displays the current CPU speed with dynamic cpufrequency scheme"
arch=('i686' 'x86_64')
url="http://www.peakunix.net/bbfreq/"
license=('GPL')
depends=('libx11' 'libsm' 'blackbox')
source=(http://www.peakunix.net/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('9e0e60282d8773c300cf5eaf775d36c3')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr
  sed -i 's|/usr/bin/install|/bin/install|' Makefile
  sed -i 's|/usr/bin/install|/bin/install|' data/Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}
