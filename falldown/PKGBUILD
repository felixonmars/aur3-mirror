# Contributor : JackDesBwa <jackdesbwa@gmail.com>
pkgname=falldown
pkgver=1.0
pkgrel=1
pkgdesc="Game in which a ball falls down and walls go up"
url="https://forge.games-creators.org/projects/falldown/"
arch=('i686' 'x86_64')
depends=(sdl_mixer mesa sdl_image)
source=(https://forge.games-creators.org/frs/download.php/37/$pkgname-$pkgver.tar.bz2)
md5sums=(b7cf59d720d96e9f45272237811f68f2)
license="GPL"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make PREFIX=$startdir/pkg/usr DESTDIR=$startdir/pkg install
}


