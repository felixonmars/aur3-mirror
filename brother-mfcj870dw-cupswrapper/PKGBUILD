# Contributor: Thomas Hipp <thomashipp(at)gmail(dot)com>

_printer=mfcj870dw
pkgname="brother-${_printer}-cupswrapper"
pkgver=3.0.0_1
_version="${pkgver//_/-}"
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-J870DW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-J870DW"
license=('GPL')
depends=('cups' 'ghostscript' "brother-${_printer}-lpr>=${pkgver}")
install="${pkgname}.install"
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${_version}.i386.deb")
sha256sums=('d6263d837ca37617603b30b384049ab5abbeac2935cce8c61e901d2b9f4aad9b')

build() {
  cd "${srcdir}"
  ar -x "${_printer}cupswrapper-${_version}.i386.deb"
}

package() {
  tar -xzf data.tar.gz -C "${pkgdir}"
}

# vim: sts=2 sw=2 et:
