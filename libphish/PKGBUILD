# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libphish
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform library to interact with the Open Phishing Database"
arch=('i686' 'x86_64')
url="http://opdb.berlios.de"
options=('NOLIBTOOL')
license="GPL"
depends=('expat')
source=(http://download.berlios.de/opdb/libphish-$pkgver.tar.bz2)
md5sums=('d6d81794e4147297917065d4465b233f')

build() {
  cd $startdir/src/libphish-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

}
