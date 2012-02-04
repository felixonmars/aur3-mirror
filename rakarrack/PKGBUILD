# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=rakarrack
pkgver=0.6.1
pkgrel=1
pkgdesc="Versatile guitar multi-effects processor"
arch=('i686' 'x86_64')
license=('GPL')
url="http://rakarrack.sourceforge.net"
depends=('alsa-utils' 'jack' 'fltk' 'libxpm')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'fltk_include.patch')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix for latest fltk include dir name
  patch -Np1 -i "$srcdir/fltk_include.patch"

  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
md5sums=('56b1e04779ae3d56cc8a3ad3c4e25152'
         'd43512466f514434daaf16bd72951ea0')
