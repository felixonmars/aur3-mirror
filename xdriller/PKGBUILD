# Maintainer: durmieu <durmieu@users.sourceforge.net>
# Contributor: durmieu <durmieu@users.sourceforge.net>
pkgname=xdriller
pkgver=0.8.0
pkgrel=3
pkgdesc="A 3d Mr Driller clone"
arch=('i686' 'x86_64')
url="http://xdriller.sf.net"
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'ogre' 'ois' 'libogg' 'libvorbis' 'gettext')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('63003f3d6b78947f2853bf959383923e')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  
  make INSTALL_PREFIX=$pkgdir/usr install || return 1
  
}
