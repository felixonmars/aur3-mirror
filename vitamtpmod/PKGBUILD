# Maintainer: codestation <codestation404@gmail.com>

pkgname=vitamtpmod
_pkgname=vitamtp
pkgver=2.5.6
pkgrel=1
_soname=4
pkgdesc="Library to interact with Vita's USB MTP protocol (fork)"
arch=("i686" "x86_64")
url="https://github.com/codestation/vitamtp"
license=('GPL')
depends=('libusb' 'libxml2')
conflicts=('vitamtp')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/codestation/${_pkgname}/archive/v${pkgver}.tar.gz")
options=('!libtool')
sha256sums=('1d7c0db20598bcedd8252b1563056e597b336b41d7c2c89786a4c133cc555a43')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/vitamtp${_soname}.udev "$pkgdir/usr/lib/udev/rules.d/80-psvita.rules"
}
