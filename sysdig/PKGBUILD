# Please submit your patch directly to:
# https://github.com/masterkorp/pkgbuilds

# Maintainer: Alfredo Palhares <masterkorp@masterkorp.net>
# Contribuitor: Christian Babeux <christian.babeux@0x80.ca>
pkgname=sysdig
pkgver=0.1.99
pkgrel=3
pkgdesc="Open source system-level exploration and troubleshooting tool"
arch=('i686' 'x86_64')
url="http://www.sysdig.org/"
license=('GPL2')
depends=('linux-headers' 'dkms' 'jsoncpp' 'luajit' 'zlib')
makedepends=('git' 'cmake')
source=("https://github.com/draios/sysdig/archive/$pkgver.tar.gz")
sha1sums=('b8a7084173ab740dc49c17d05ca77fba97e9baa1')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DDIR_ETC=/etc -DSYSDIG_VERSION=${pkgver} -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_JSONCPP=OFF -DUSE_BUNDLED_ZLIB=OFF ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cd build
  make install DESTDIR=${pkgdir}
}
