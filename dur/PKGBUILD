# Maintainer: aaditya <aaditya_gnulinux[at]zoho[dot]com>

pkgname=dur
pkgver=1.1
pkgrel=1
pkgdesc="A C program to calculate the difference between 2 dates in days."
url="https://github.com/aadityabagga/dur"
arch=('x86 x86_64')
license=('GPL')
depends=()
source=("https://github.com/aadityabagga/dur/archive/${pkgver}.tar.gz")
sha1sums=('747612120cfd19023a3823227f6597103cd01143')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" docdir="/usr/share/doc" mandir="/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:


