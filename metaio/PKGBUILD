# Maintainer: 
pkgname=metaio
pkgver=8.3.0
pkgrel=0
pkgdesc="Library for parsing LIGO_LW XML Table files."
url="https://www.lsc-group.phys.uwm.edu/daswg/projects/metaio.html"
arch=('any')
license=('GPLv2')
groups=('lscsoft')
depends=('libxml2')
source=("https://www.lsc-group.phys.uwm.edu/daswg/download/software/source/${pkgname}-${pkgver}.tar.gz")

md5sums=('4d244197051fc1c1a9c2c5f82e14dc4c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et: