pkgname=qbittorrent-dev
pkgver=3.0.0_rc5
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library (development version)"
url="http://www.qbittorrent.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libtorrent-rasterbar' 'qt' 'xdg-utils')
makedepends=('boost' 'geoip')
optdepends=('python: needed for search'
            'geoip: improves peer country resolution')
provides=('qbittorrent')
conflicts=('qbittorrent')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/qbittorrent/qbittorrent-unstable/qbittorrent-${pkgver/_/}.tar.xz")
md5sums=('7cfe87360b79f6fa379a8f8cebc48808')

build() {
  cd qbittorrent-${pkgver/_/}

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/qbittorrent-${pkgver/_/}

  make INSTALL_ROOT="$pkgdir/" install
}
