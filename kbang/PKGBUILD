# Contributor: Lukas Marsik <lukas dot marsik at gmail dot com>

pkgname=kbang
pkgver=0.1.3
pkgrel=1
pkgdesc="A multiplayer wild west-themed card game." 
arch=('i686' 'x86_64')
url="http://code.google.com/p/kbang/"
license=('GPL2')
depends=('qt>=4.4')
install=kbang.install
source=(http://kbang.googlecode.com/files/$pkgname-$pkgver-src.tar.bz2)
md5sums=('bb7a1d0313f9d51e4d893ba27f0b1650')

build() {

  # Make binary 
  cd $srcdir/$pkgname-$pkgver-src
  qmake kbang.pro || return 1
  make || return 1

  # Copy to /usr/local/games
  install -d $pkgdir/usr/local/games/kbang
  cp -r gfx $pkgdir/usr/local/games/kbang
  install -m 755 kbang-client $pkgdir/usr/local/games/kbang
  install -m 755 kbang-server $pkgdir/usr/local/games/kbang

  # Install run hacks (binary have to be runned from the same directory as gfx dir is)
  install -d $pkgdir/usr/local/bin
  echo -e "#!/bin/sh\ncd /usr/local/games/kbang && ./kbang-client" > $pkgdir/usr/local/bin/kbang-client
  chmod 755 $pkgdir/usr/local/bin/kbang-client 
  echo -e "#!/bin/sh\ncd /usr/local/games/kbang && ./kbang-server" > $pkgdir/usr/local/bin/kbang-server
  chmod 755 $pkgdir/usr/local/bin/kbang-server 

}
