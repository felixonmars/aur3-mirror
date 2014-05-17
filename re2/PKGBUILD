# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=re2
pkgver=20140304
pkgrel=1
pkgdesc="efficient, principled regular expression library"
url="http://code.google.com/p/re2/"
depends=('gcc-libs')
arch=('i686' 'x86_64')
license=('BSD')
source=("https://re2.googlecode.com/files/${pkgname}-${pkgver}.tgz")
sha1sums=('f30dda8e530921b623c32aa58a5dabbe9157f6ca')

prepare() {
  rm -fr build fakeroot
  cp -R "${pkgname}" build

  LDFLAGS+=" -pthread"
}

build() {
  cd build
  make prefix=/usr
}

check() {
  cd build
  make prefix=/usr test
}

package() {
  cd build
  make prefix=/usr DESTDIR="${pkgdir}" install
}