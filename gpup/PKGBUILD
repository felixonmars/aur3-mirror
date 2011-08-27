# Maintainer: Tetsumaki <http://goo.gl/YMBdA>

pkgname=gpup
pkgver=1.00
pkgrel=1
pkgdesc="Extractor/Packer for official PS3 firmware update files"
arch=('i686' 'x86_64')
url="http://www.ps3hax.net/2011/01/gpup-v1-00-released-pup-extractorpacker/"
license=('GPLv3')
makedepends=('boost' 'codeblocks')
source=(http://superg.org.ua/files/ps3/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('965bd57d2d9c56f263d8eb8a004fd84f4a0687fcdb20641ca6ff7cad1209eed5')

build() {
  cd "${srcdir}/${pkgname}"
  codeblocks --build gpup.cbp
}

package() {
  cd "${srcdir}/${pkgname}/output"
  install -D -m755 gpup_d "${pkgdir}/usr/bin/gpup_d"
}
