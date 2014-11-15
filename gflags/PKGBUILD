# Maintainer: Anatol Pomozov <anatol.pomozov gmail>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=gflags
pkgver=2.1.1
pkgrel=3
pkgdesc='C++ Library for commandline flag processing'
arch=(i686 x86_64)
url='https://github.com/schuhschuh/gflags'
license=(BSD)
depends=(gcc-libs)
makedepends=(cmake)
# google-gflags was renamed to just gflags
provides=(google-gflags=$pkgver)
conflicts=(google-gflags)
source=(https://github.com/schuhschuh/gflags/archive/v$pkgver.tar.gz)
sha1sums=('59b37548b10daeaa87a3093a11d13c2442ac6849')

build() {
  cd gflags-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTING=ON
  make
}

check() {
  cd gflags-$pkgver
  make test
}

package() {
  cd gflags-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}
