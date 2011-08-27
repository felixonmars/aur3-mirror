# Contributor: Ivan Reche <ivan.reche@gmail.com>
pkgname=rcsslogplayer
pkgver=11.1.1
pkgrel=3
pkgdesc="The RoboCup Soccer Simulator LogPlayer (rcsslogplayer) is a game log replay tool for the RoboCup Soccer Simulator Server (rcssserver)."
arch=('i686')
url="http://sserver.sourceforge.net/"
depends=('rcssbase' 'libx11' 'libxau')
makedepends=('make' 'boost')
source=(http://downloads.sourceforge.net/sourceforge/sserver/$pkgname-$pkgver.tar.bz2)
md5sums=('91c28b9136f99dad3dda45d8c172c3b9')
license=('GPL')

build() {
  cd $startdir/src/rcsslogplayer-11.1.1/
  ./configure --prefix=/usr
  make
  make prefix=$startdir/pkg/usr install
}
