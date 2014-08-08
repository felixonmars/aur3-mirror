# $Id$
# Maintainer: tantalum@online.de

pkgname=xbindkeys-minimal
pkgver=1.8.6
pkgrel=1
pkgdesc="Launch shell commands with your keyboard or your mouse under X. Without 'tk' and 'guile' dependencies."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('libx11')
conflicts=('xbindkeys')
_source_pkgname=xbindkeys
source=(http://www.nongnu.org/${_source_pkgname}/${_source_pkgname}-${pkgver}.tar.gz)
md5sums=(c6ea9db56e075dae0697497e2ed390cc)

build() {
  cd "${srcdir}/${_source_pkgname}-${pkgver}"
  ./configure --disable-tk --disable-guile --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_source_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
