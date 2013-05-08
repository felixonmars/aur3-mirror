# Maintainer: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=x262
pkgver=2508.37d9949
pkgrel=1
pkgdesc="x264 with MPEG-2 video support"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
url="https://github.com/kierank/x262"
source=('git://github.com/kierank/x262.git')
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $pkgname

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/x262 \
    --includedir=/usr/include/x262 \
    --enable-static

  make
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
  rm ${pkgdir}/usr/bin/x264
}
