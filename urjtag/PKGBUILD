# Maintainer: Laszlo Papp <djszapi2 at gmail dot com>
pkgname=urjtag
pkgver=0.10
pkgrel=1
pkgdesc="Enhanced, modern tool for communicating over JTAG with flash chips, CPUs,and many more"
url="http://www.urjtag.org/"
depends=(libftd2xx)
makedepends=(gcc libftd2xx flex bison)
license=('GPL')
options=(!strip)
arch=(i686 x86_64)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f7d1236a1e3ed2cf37cff1987f046195')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --with-ftd2xx --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir}/ install
}
