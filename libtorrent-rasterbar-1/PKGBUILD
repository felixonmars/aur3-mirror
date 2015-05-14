# Maintainer : David Christenson <david@the-david.com>

pkgname=libtorrent-rasterbar-1
_pkg=libtorrent-rasterbar
pkgver=1.0.5
pkgrel=1
epoch=1
pkgdesc="A C++ implementation of the BitTorrent protocol with the goals of being efficient and easy to use."
url="http://www.libtorrent.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('boost-libs' 'openssl' 'python2' 'geoip')
makedepends=('boost')
conflicts=('libtorrent-rasterbar')
provides=('libtorrent-rasterbar')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/project/libtorrent/libtorrent/$_pkg-$pkgver.tar.gz)
sha256sums=('474a43da2147bec7e333c10f70b07221f4732dd67e071d5e90acc7edb8f657b0')

build() {
  cd $_pkg-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
      --enable-python-binding \
      --with-libgeoip=system \
      --enable-encryption
  make
}

package() {
  cd $_pkg-$pkgver
  make DESTDIR="$pkgdir" install
  install -D COPYING "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
}
