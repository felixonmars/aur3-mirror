# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=hypertable
pkgver=0.9.7.8
pkgrel=2
pkgdesc='High performance, scalable, distributed storage and processing system'
arch=('x86_64' 'i686')
url='http://code.google.com/p/hypertable/'
license=('GPL2')
depends=('log4cpp' 'libsigar' 'thrift' 'gperftools' 'kfs' 'rrdtool' 'ceph'
         're2-hg' 'snappy' 'cronolog')
makedepends=('cmake')
install=hypertable.install
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver-src.tar.gz"
        hypertable.install)
sha256sums=('457bf413a3cf54e5216aaef53bd05cee2578c3b5ddf2b6ff5044c524fd45c303'
            '875bf6ae1d11642ed3a983afba8a54b11ecd011a471af9c529915400661b1362')

build() {
  cd "$srcdir"
  
  rm -rf build
  mkdir build
  cd build

  export CXXFLAGS="$CXXFLAGS -fpermissive -lboost_regex"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DThrift_LIB=/usr/lib/libthrift.so \
    -DSIGAR_LIBRARY=/usr/lib/libsigar.so \
    -DCMAKE_CXX_FLAGS=' -fpermissive -lboost_regex' \
    "../$pkgname-$pkgver"

  make -j1
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
  ln -s "$pkgver" "$pkgdir/opt/hypertable/current"
}
