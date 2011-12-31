# Maintainer: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname="ppss"
pkgver=2.97
pkgrel=3
pkgdesc="(Distributed) Parallel Processing Shell Script"
arch=('any')
url="http://code.google.com/p/ppss/"
license=('GPL3')
depends=('bash' 'ncurses')
makedepends=()
source=("http://ppss.googlecode.com/files/${pkgname}-${pkgver}.tgz")
sha256sums=('25d819a97d8ca04a27907be4bfcc3151712837ea12a671f1a3c9e58bc025360f')

build() {
  return 0 # nothing to build
}

package() {
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
