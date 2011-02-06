# Mantainer: Sergi March <sergi dot march at gmail dot com>
pkgname=pokerth-dev
_realname=PokerTH
pkgver=0.8.2
pkgrel=1
pkgdesc="Poker game written in C++/QT4. Ranking Online version"
arch=('i686' 'x86_64')
url="http://www.pokerth.net/"
license=('GPL' 'custom')
depends=('curl' 'boost-libs>=1.43.0' 'gnutls' 'qt' 'sdl_mixer' 'gsasl')
conflicts=('pokerth')
makedepends=('boost')
source=(http://downloads.sourceforge.net/sourceforge/pokerth/$_realname-$pkgver-src.tar.bz2)
md5sums=('bc9af0733d32c16e23fb9975e9aba100')

build() {
  cd "$srcdir/$_realname-$pkgver-src"
  
  qmake pokerth.pro || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_realname-$pkgver-src"

  make INSTALL_ROOT="$pkgdir" install || return 1

  install -D -m755 pokerth "$pkgdir/usr/bin/pokerth" || return 1
  install -D -m644 docs/pokerth.1 "$pkgdir/usr/share/man/man1/pokerth.1" || return 1

}
