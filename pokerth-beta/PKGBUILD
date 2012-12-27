# $Id: PKGBUILD 74006 2012-12-27

pkgname=pokerth-beta
_realname=PokerTH
pkgver=1.0
pkgrel=2
pkgdesc="Poker game written in C++/QT4"
arch=('i686' 'x86_64')
url="http://www.pokerth.net/"
license=('GPL' 'custom')
depends=('curl' 'boost-libs' 'gsasl' 'gnutls'
         'qt' 'sdl_mixer' 'libircclient' 'tinyxml')
makedepends=('boost')
source=(http://downloads.sourceforge.net/sourceforge/pokerth/1.0/$_realname-$pkgver-beta2-src.tar.bz2)
md5sums=('204555c58f4388ff3ca8abdc78c913fb')

build() {
  cd "$srcdir/$_realname-$pkgver-beta2-src"

  sed -i '1 i #include <unistd.h>' src/third_party/qtsingleapplication/qtlocalpeer.cpp

  sed -i '23 i #include <libircclient/libirc_rfcnumeric.h>' src/net/common/ircthread.cpp

  # fix g++: error: unrecognized option '-no_dead_strip_inits_and_terms'
  sed \
    -e 's/QMAKE_LFLAGS += -no_dead_strip_inits_and_terms//' \
    -i zlib_compress.pro pokerth_game.pro pokerth_server.pro

  qmake $pkgname.pro
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver-beta2-src"

  make INSTALL_ROOT="$pkgdir-beta" install

  install -D pokerth "$pkgdir/usr/bin/$pkgname"
}
