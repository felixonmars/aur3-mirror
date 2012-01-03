pkgname=opencc
pkgver=0.3.0
pkgrel=1
pkgdesc="Library for Open Chinese Convert"
arch=(i686 x86_64)
url="http://code.google.com/p/opencc/"
license=('Apache License 2.0')
depends=('glibc')
makedepends=('cmake')
source=("http://opencc.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")

build() {
  cd $srcdir/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
md5sums=('84462870e5d491da24bb33a5fb494911')
