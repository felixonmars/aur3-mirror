# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=sdlhana
pkgver=0.34
pkgrel=2
pkgdesc="Hanafuda is a Japanese-oriented card game which is mostly played in Japan and Korea, also known as Hwa-T'u in Korean."
arch=('i686' 'x86_64')
url="http://sdlhana.nongnu.org/"
license=('GPL')
depends=('sdl')
source=(http://nongnu.uib.no/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f7892f453a66100485bc2f0b8857d9b1')


build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
