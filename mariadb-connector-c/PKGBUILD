# Maintainer: Jan Was <janek.jan@gmail.com>

pkgname=mariadb-connector-c
pkgver=2.1.0
pkgrel=1
pkgdesc="LGPL MariaDB client library"
arch=('i686' 'x86_64')
url="http://mariadb.org"
license=('LGPL')
depends=()
makedepends=('cmake' 'openssl' 'zlib')
optdepends=()
install="${pkgname}.install"
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/source-tgz/${pkgname}-${pkgver}-src.tar.gz"
        'mariadb-connector-c.conf')
md5sums=('c026525ad2cec882b00070ba92fa0bc1'
         '1bfc3bccebed1fbe59512904c9be40a6')
sha256sums=('568050b89463af7610d458669fd9eee06dcc9405689aca8a526ac8c013b59167'
            'e13627b886af7aeb85666ef2a55e437892c106b1c6f14813d892d54bbf875939')

build() {
  cd "$srcdir"

  mkdir -p build
  cd build

  cmake ../${pkgname}-${pkgver}-src \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"
  make -C 'build/' DESTDIR="$pkgdir" install

  install -Dm 644 'mariadb-connector-c.conf' "${pkgdir}/etc/ld.so.conf.d/mariadb-connector-c.conf"
}

