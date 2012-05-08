# Maintainer: Ner0

pkgname=rosa-media-player-bin
_pkgname=rosa-media-player
pkgver=1.0
pkgrel=2
pkgdesc="A front-end for MPlayer based on SMPlayer"
arch=('i686' 'x86_64')
url="http://www.rosalab.ru/"
license=('GPL2')
depends=('qt' 'mplayer')
optdepends=('rosa-media-player-plugin: Mozilla plugin [AUR]')
conflicts=('rosa-media-player')
install=$pkgname.install
source=("https://github.com/megabaks/test/raw/master/distfiles/$_pkgname-$pkgver.tar.gz")
md5sums=('8c3877fc2fd1cecb146ef6bbbaed6823')

build() {
  cd $_pkgname

  sed -i '1i#define OF(x) x' \
	src/findsubtitles/quazip/ioapi.{c,h} \
	src/findsubtitles/quazip/{zip,unzip}.h

  make PREFIX=/usr
}

package() {
  cd "$srcdir/rosa-media-player"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
