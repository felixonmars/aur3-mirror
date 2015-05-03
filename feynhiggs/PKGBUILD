# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tong Chunli <piggy1983@163.com>

pkgname=feynhiggs
pkgver=2.10.4
pkgrel=1
pkgdesc="A package for the calculation of the masses, mixings and much more of the Higgs bosons in the MSSM"
arch=('i686' 'x86_64')
url="http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('gcc-fortran')
source=("http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/FeynHiggs-${pkgver}.tar.gz")
sha512sums=('3a64545b3c1a8f5afb4a0db4c52bec138fc75989ce6499da057ae363b2ba4d058473ae53ac751073d18689b99ea141b38e6f54374fe61f659c3989340c394755')

build() {
  cd "${srcdir}/FeynHiggs-${pkgver}"

  # Fix for x86_64
  sed -i 's_$(LIBDIRSUFFIX)__' makefile.in

  ./configure --prefix=/usr \
              --enable-slhapara
#              --enable-full-g-2 # Disabled due to compilation error

  # If you want to build the Mathematica frontend, uncomment 'all'
  make all
}

package() {
  cd "${srcdir}/FeynHiggs-${pkgver}"
  make PREFIX="${pkgdir}/usr" install

  # Install man files
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -m644 man/man1/*.1 "${pkgdir}/usr/share/man/man1"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 man/api.* "${pkgdir}/usr/share/doc/${pkgname}"
}
