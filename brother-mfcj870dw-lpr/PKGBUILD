# Contributor: Thomas Hipp <thomashipp(at)gmail(dot)com>

_printer=mfcj870dw
pkgname="brother-${_printer}-lpr"
pkgver=3.0.0_1
_version="${pkgver//_/-}"
pkgrel=1
pkgdesc="LPR driver for Brother MFC-J870DW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-J870DW"
license=('GPL')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${_version}.i386.deb")
sha256sums=('f557821096dbfc6c5e65efbc227ada49aa2a14c04941208d0b486b8fe34d04ce')

build() {
  cd "${srcdir}"
  ar -x "${_printer}lpr-${_version}.i386.deb"
}

package() {
  tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}

# vim: sts=2 sw=2 et:
