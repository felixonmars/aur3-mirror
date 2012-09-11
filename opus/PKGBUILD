# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: pumbur

pkgname=opus
pkgver=1.0.1
pkgrel=1
pkgdesc="codec designed for interactive speech and audio transmission over the Internet"
arch=('i686' 'x86_64')
url="http://www.opus-codec.org/"
license=('BSD')
source=("http://downloads.xiph.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
options=('!libtool')
md5sums=('bbac19996957b404a1139816e2f357f5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
