# $Id: PKGBUILD 79200 2010-05-01 18:07:48Z andyrtr $
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

pkgname=meego-icu
pkgver=4.4.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs' 'sh')
provides=('icu=4.4.1')
replaces=('icu')
conflicts=('icu')
source=(http://download.icu-project.org/files/icu4c/${pkgver}/icu4c-${pkgver//./_}-src.tgz)
md5sums=('b6bc0a1153540b2088f8b03e0ba625d3')

build() {
  cd ${srcdir}/icu/source
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1

  make -j1 DESTDIR=${pkgdir} install || return 1

  # Install license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/icu/license.html
}

