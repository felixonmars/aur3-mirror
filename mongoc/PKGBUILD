# Contributor: Philip Nilsson <pnilsson@nullref.se>
# Contributor: Valentin V. Bartenev <ne@vbart.ru> http://vbart.info/
# Contributor: FrÃ©dÃ©ric Mangano <fmang@mg0.fr>

pkgname='mongoc'
pkgver='0.8.1'
pkgrel='3'
pkgdesc='The legacy MongoDB C driver and BSON library.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=(glibc)
makedepends=()
source=("https://github.com/mongodb/mongo-c-driver-legacy/archive/v0.8.1.tar.gz")
md5sums=('03b7e582f7847cc17204d009063f66fe')
build() {
  cd "mongo-c-driver-legacy-$pkgver"
  sed -i Makefile -e '/INSTALL/ s,src/bson\.h,& src/gridfs.h,'
  make
}

package() {
  cd "mongo-c-driver-legacy-$pkgver"
  make install \
    INSTALL_INCLUDE_PATH="$pkgdir/usr/include" \
    INSTALL_LIBRARY_PATH="$pkgdir/usr/lib"
}

