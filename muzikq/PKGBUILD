# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=muzikq
pkgver=0.5
pkgrel=2
pkgdesc="muzikQ is a curses/SDL_mixer based audio player currently supporting mp3 & ogg."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/muzikq/"
license=('GPL3')
depends=('sdl_mixer' 'taglib')
source=(http://prdownloads.sourceforge.net/muzikq/muzikQ-$pkgver.tar.gz)
md5sums=('1883f07506fab8441d49917ed8c171e9')

prepare() {
  cd $srcdir/muzikQ-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/muzikQ-$pkgver
  make
}

package() {
  cd $srcdir/muzikQ-$pkgver
  make DESTDIR=$pkgdir install
}
