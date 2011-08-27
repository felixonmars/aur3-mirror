# Contributor: Christopher Daley <crdaley (at) gmail>

pkgname=projectm-xmms
pkgver=1.2.0
pkgrel=4
pkgdesc="A Qt based GUI for projectM that visualizes your PulseAudio output in XMMS."
url="http://xmms-projectm.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
groups=('projectm-pulse')
depends=('projectm' 'xmms')
makedepends=('pkgconfig' 'xproto' 'cmake' 'xmms')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
source=(http://downloads.sourceforge.net/sourceforge/projectm/projectM-xmms-$pkgver.tar.bz2)
noextract=()
md5sums=(72bbfa00c5d4595b81b54837389ab95e)

build() {
  cd $srcdir/projectM-xmms-$pkgver
  cmake .
  cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr . 
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
