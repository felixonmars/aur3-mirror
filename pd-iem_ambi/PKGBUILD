# Maintainer: Em Ludek <ludek.me@gmail.com>
pkgname=pd-iem_ambi
_pkg=iem_ambi
pkgver=0.2
pkgrel=1
pkgdesc="Pure Data: generic Ambisonics encoder/decoder library"
arch=('any')
url="http://www.puredata.info"
license=('GPL2')
depends=(pd)
source=("http://downloads.sourceforge.net/project/pure-data/libraries/$_pkg/$_pkg-$pkgver.tar.gz")
md5sums=('28cdf18f371c534904097abfdaa2bda6')

build() {
  cd "$srcdir/$_pkg-$pkgver/src"

  sed -i 's|usr/local|usr|g' makefile_linux

  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  mkdir -p "$pkgdir/usr/lib/pd/extra" && cp "$_pkg".pd_linux "$pkgdir/usr/lib/pd/extra"
}
