# Maintainer: Chen Tong <blovemaple2010@gmail.com>

pkgname=java-mapdb
pkgver=0.9.2
pkgrel=1
pkgdesc='A Java library (formerly JDBM4) providing concurrent TreeMap and HashMap backed by disk storage, which is a fast, scalable and easy to use embedded Java database.'
arch=('i686' 'x86_64')
url='http://www.mapdb.org/'
license=('APACHE')
makedepends=('maven')
depends=('java-runtime-headless')
source=("https://github.com/jankotek/MapDB/archive/mapdb-${pkgver}.tar.gz")


build() {
  cd MapDB-mapdb-${pkgver}
  
  mvn install
}

package() {
  cd MapDB-mapdb-${pkgver}/target

  install -D -m644 \
    mapdb-${pkgver}.jar $pkgdir/usr/share/java/mapdb/mapdb-${pkgver}.jar
  ln -s mapdb-${pkgver}.jar $pkgdir/usr/share/java/mapdb/mapdb.jar 

  install -D -m644 \
    mapdb-${pkgver}-sources.jar $pkgdir/usr/share/java/mapdb/mapdb-${pkgver}-sources.jar
  ln -s mapdb-${pkgver}-sources.jar $pkgdir/usr/share/java/mapdb/mapdb-sources.jar 
}

md5sums=('40f596a99a980f6be21e6e1e9ee92e66')
