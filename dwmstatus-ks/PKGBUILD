# Maintainer: William Giokas <1007380@gmail.com>

pkgname=dwmstatus-ks
_pkgname=dwmstatus
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple C status bar for dwm, fork by KaiSforza"
url=("https://bitbucket.org/KaiSforza/dwmstatus")
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('libx11')
provides=('dwmstatus')
conflicts=('dwmstatus')
source=("https://bitbucket.org/KaiSforza/dwmstatus/downloads/${_pkgname}-${pkgver}.tar.gz"
         config.h)
md5sums=('f0be8f3cfba67fcde7c42eb59248da77'
         'bb4b731ddfa9fbdd13f125022e2894a6')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  cp "${srcdir}/config.h" "$srcdir/${_pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
