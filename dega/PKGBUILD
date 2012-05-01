# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=dega
pkgver=1.12
pkgrel=2
pkgdesc="A Sega Master System, Mark III and Game Gear emulator"
arch=('i686' 'x86_64')
url="http://www.emulinks.de/emus/"
license=('custom')
depends=('sdl')
makedepends=('nasm')
source=("http://www.emulinks.de/emus/${pkgname}-${pkgver}.tar.gz")
md5sums=('31bb460a2e2ac016e0985ba5064e9fde')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s/libs)/& -lm/" Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install a binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 ChangeLog dega.txt README "${pkgdir}/usr/share/doc/${pkgname}"

  # Install a license file
  sed -n "18,22p" dega.txt > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
