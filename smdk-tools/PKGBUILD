# Maintainer: Jacob Grevald <archpkg@jacobgrevald.dk>

pkgname=smdk-tools
pkgver=0.20
pkgrel=1
pkgdesc="Tool to communicate with Samsung SMDK boards"
arch=('any')
url="http://www.fluff.org/ben/smdk/tools/"
license=('as-is')
depends=('libusb')
source=("${pkgname}-${pkgver}.tar.gz::http://www.fluff.org/ben/smdk/tools/downloads/${pkgname}-v${pkgver}.tar.gz"
        "smdk-usbdl.1.gz")
md5sums=('35ce4f6ab3e518faa5dfc475ac99ef92'
         '79f5d52eb8720eb63cd0508beb18de5a')

build() {
  cd ${srcdir}/releases/${pkgname}-v${pkgver}/dltool/
  make
}

package() {
  mkdir -p ${pkgdir}/usr/share/man/man1/
  mkdir -p ${pkgdir}/usr/bin/
  install -g 0 -o 0 -m 0644 ${srcdir}/smdk-usbdl.1.gz ${pkgdir}/usr/share/man/man1/smdk-usbdl.1.gz

  cd ${srcdir}/releases/${pkgname}-v${pkgver}/dltool/
  cp smdk-usbdl ${pkgdir}/usr/bin/smdk-usbdl
}
