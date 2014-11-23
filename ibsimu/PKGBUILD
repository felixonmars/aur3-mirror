# Maintainer: Gustavo Castro << gustawho [at] gmail [dot] com >>
pkgname=ibsimu
pkgver=1.0.5b
pkgrel=1
pkgdesc="Ion Beam Simulator: Library for ion optics, plasma extraction and space charge dominated ion beam transport."
url="http://ibsimu.sourceforge.net/"
arch=('x86_64')
license=('GPLv2')
depends=('fontconfig' 'freetype2' 'zlib' 'cairo' 'libpng' 'gtk2' 'clthreads' 'gsl')
makedepends=('gcc' 'pkg-config')
replaces=()
source=("http://sourceforge.net/projects/$pkgname/files/libibsimu-$pkgver.tar.gz")
sha512sums=('2f29ab6c465d0db871468d6255f617b84f9da1e22816df85b4b2c9e1b25d6ae1a0ac82191f25ae2f50c06b0503d1de31a5b70b821e1ae49421873654643a3731')

build() {
  cd "${srcdir}/libibsimu-${pkgver}"
  ./configure --prefix=/usr
  make
  make check
}

package() {
  cd "${srcdir}/libibsimu-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
