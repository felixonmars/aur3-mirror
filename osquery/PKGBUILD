# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=osquery
pkgver=1.2.2
pkgrel=1
pkgdesc='Tool makes low-level operating system analytics and monitoring both performant and intuitive'
arch=(i686 x86_64)
url='https://github.com/facebook/osquery/'
license=(BSD)
depends=(rocksdb google-glog thrift procps-ng gflags boost-libs rpm-org)
makedepends=(cmake doxygen boost git python2-jinja libunwind python2)
source=(https://github.com/facebook/osquery/archive/$pkgver.zip
        git://github.com/osquery/third-party
        compile_fixes.patch)
sha1sums=('92995f3fe484140b671637bbf54b21e695caafc1'
          'SKIP'
          '1231b2442e9b43c3d4d60cbb669c44e84ae4f38b')

prepare() {
  cd osquery-$pkgver
  rm -r third-party
  ln -sf ../third-party

  patch -p1 < ../compile_fixes.patch

  sed -e 's|python|python2|g' -i osquery/CMakeLists.txt
}

build() {
  cd osquery-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_SHARED=ON
  make
}

check() {
  cd osquery-$pkgver
  make test
}

package () {
  cd osquery-$pkgver
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
