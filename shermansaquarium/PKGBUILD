# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=shermansaquarium
pkgver=3.0.1
pkgrel=2
pkgdesc="This applet gives you an aquarium with some randomly selected fishes that lives there"
arch=('i686')
url="http://aquariumapplet.sourceforge.net"
license="GPL"
source=(http://dl.sourceforge.net/sourceforge/aquariumapplet/shermans_aquarium-${pkgver}.tar.bz2)
depends=('gai')
md5sums=('2be1531e45c535f148e2416c8d0abd5a')

build()  {
  cd $startdir/src/shermans_aquarium-${pkgver}
  ./configure --prefix=/usr/ --disable-sdl
  make || return 1
  make DESTDIR=$startdir/pkg install
}
#
