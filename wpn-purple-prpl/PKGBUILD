# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=wpn-purple-prpl
pkgver=0.2.1
pkgrel=1
pkgdesc="Pidgin plugin to connect to the WinMX network"
arch=('i686')
url="http://sourceforge.net/projects/wpn-gaim-prpl"
license=('GPL2')
depends=('pidgin')
options=('!libtool')
source=(http://downloads.sourceforge.net/wpn-gaim-prpl/$pkgname-$pkgver.tar.bz2)
md5sums=('a640902e6b00e68789e67e984d5637ef') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
