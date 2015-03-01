# $Id$
# Maintainer: Michael Schindhelm <mschindhelm@gmx.de>

pkgname=ecap-clamav-adapter
pkgver=1.0.0
pkgrel=1
pkgdesc='eCAP ClamAV adapter'
arch=('x86_64' 'i686')
url='http://www.e-cap.org/Downloads'
license=('GPLv2')
depends=('libecap')
source=("http://www.measurement-factory.com/tmp/ecap/ecap_clamav_adapter-$pkgver.tar.gz")
md5sums=('40fbec3f9d7a149e12f08e13d92723b6')

build() {
  cd "$srcdir/ecap_clamav_adapter-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"
  make -C "ecap_clamav_adapter-$pkgver" DESTDIR="$pkgdir" install
}
