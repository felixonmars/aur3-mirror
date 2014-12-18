# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=stymulator
pkgver=0.21a
pkgrel=1
pkgdesc="Open source YM chiptune(Atari ST) music player and YM to WAV converter."
arch=('i686' 'x86_64')
url="http://www.atariarea.krap.pl/stymulator/"
license=('GPL2')
depends=('alsa-lib' 'ncurses')
source=(http://www.atariarea.krap.pl/$pkgname/files/STYMulator-$pkgver.tar.gz)
md5sums=('e6ab8164dfac0300bb91a82f6e704841')

build() {
  cd $srcdir/STYMulator-$pkgver/src
  make
}

package() {
  cd $srcdir/STYMulator-$pkgver/src
  install -Dm755 ym2wav $pkgdir/usr/bin/ym2wav
  install -Dm755 ymplayer $pkgdir/usr/bin/ymplayer
}
