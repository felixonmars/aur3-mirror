# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# https://github.com/christopherobin/pkgbuilds/blob/master/php-pdo-cassandra/PKGBUILD

pkgname=php-pdo-cassandra-git
pkgver=222.62be4fa
pkgrel=1
pkgdesc="PHP extension for accessing cassandra through PDO using CQL"
arch=('i686' 'x86_64')
url="https://github.com/Orange-OpenSource/YACassandraPDO"
license=('Apache')
depends=('php' 'thrift' 'boost')
backup=('etc/php/conf.d/pdo-cassandra.ini')
install=php-pdo-cassandra.install
source=("git+https://github.com/Orange-OpenSource/YACassandraPDO.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/YACassandraPDO"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/YACassandraPDO"
  phpize
  ./configure
  sed -i "s/apache::thrift::to_string/::apache::thrift::to_string/" gen-cpp/cassandra_types.cpp
  make
}

package() {
  cd "${srcdir}/YACassandraPDO"
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=pdo_cassandra.so' > "pdo-cassandra.ini"
  install -D -m644 "pdo-cassandra.ini" "${pkgdir}/etc/php/conf.d/pdo-cassandra.ini"
}
