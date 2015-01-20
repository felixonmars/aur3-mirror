# Maintainer: Jan Was <janek.jan@gmail.com>
# Modification: EnteEnteEnte <ducksource@duckpond.ch>

pkgname=mariadb-native-client
_pkgname=mariadb_client
pkgver=2.0.0
pkgrel=2
pkgdesc="LGPL MariaDB client library"
arch=('i686' 'x86_64')
url="http://mariadb.org"
license=('LGPL')
depends=()
makedepends=('cmake' 'openssl' 'zlib')
optdepends=()
install="${pkgname}.install"
source=("https://downloads.mariadb.org/interstitial/client-native-${pkgver}/src/${_pkgname}-${pkgver}-src.tar.gz"
        'mariadb-native.conf')
md5sums=('a233181e03d3c307668b4c722d881661'
         '1bfc3bccebed1fbe59512904c9be40a6')
sha256sums=('fd2f751dea049c1907735eb236aeace1d811d6a8218118b00bbaa9b84dc5cd60'
            'e13627b886af7aeb85666ef2a55e437892c106b1c6f14813d892d54bbf875939')

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  cmake ../${_pkgname}-${pkgver}-src \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"
  make -C 'build/' DESTDIR="$pkgdir" install

  install -Dm 644 'mariadb-native.conf' "${pkgdir}/etc/ld.so.conf.d/mariadb-native.conf"
}

