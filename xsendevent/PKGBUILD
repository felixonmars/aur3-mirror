# Maintainer: epitron <chris at ill-logic dot com>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Category: x11

pkgname=xsendevent
pkgver=2.1
pkgrel=2
pkgdesc="xse from X11R5 contrib, a CLI for XSendEvent(3)"
url='http://ftp.x.org/R5contrib/'
license=("custom")
arch=('i686' 'x86_64')
depends=('libxaw')
makedepends=('imake')
source=("http://ftp.x.org/R5contrib/${pkgname}-${pkgver}.tar.Z")
md5sums=('a3f564332ab1e079a2f3d01809f4bd0b')

build() {
  cd ${srcdir}/xse-${pkgver}
  xmkmf -a
  make || return 1
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install.man
  install -Dm644 README ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
