# Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=biloba
pkgver=0.6
pkgrel=1
pkgdesc="An abstract strategy game for 1 to 4 players."
url="http://biloba.sf.net/"
depends=('sdl_image' 'sdl_mixer')
arch=('i686')
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)

md5sums=('a92a73e84ec1b62abeae8b3855d0220c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
