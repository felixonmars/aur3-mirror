# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Xavier de Labouret <arch@2-lab.net>

pkgname=sjeng
pkgver=11.2
pkgrel=4
pkgdesc="A chess engine that plays variants of the game: suicide, crazyhouse ... and standard chess. Compatible with board programs like eboard and xboard."
arch=('i686' 'x86_64')
url="http://www.sjeng.org/indexold.html"
license="GPL"

source=(http://www.sjeng.org/ftp/Sjeng-Free-${pkgver}.tar.gz)
md5sums=('6561e740b7af703c16701304697d2870')
sha512sums=('cda3409d732ac1b07e83ccc0d3063d24497651097c633500dfca66fbb3021532053082ac57a5e23909dd1016a2bae07f166e56b82c4ce834749a101c9ee444b8')

build() {
  cd "${srcdir}/Sjeng-Free-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/Sjeng-Free-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
