# Contributor: William Rea <sillywilly@gmail.com>
pkgname=librasc
pkgver=0.1
pkgrel=2
pkgdesc="A C library designed to connect audio software to a remote audio samples collection"
arch=('i686' 'x86_64')
url="http://www.librasc.org"
options=('NOLIBTOOL')
license="GPL"
depends=('curl' 'libxml2')
source=(http://dl.sourceforge.net/sourceforge/libsampleremote/$pkgname-$pkgver.tar.bz2)
md5sums=('79dc7da6aaf8409ed1cd2211bc1ea7d6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
