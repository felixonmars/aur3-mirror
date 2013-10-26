# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com> 

_printer=mfc495cw
pkgname=brother-${_printer}-cupswrapper
pkgver=1.1.3_1
_version="${pkgver//_/-}"
pkgrel=1
pkgdesc="LPR-to-CUPS wrapper for Brother MFC-495CW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-495CW"
license=('GPL')
depends=('cups' 'ghostscript' "brother-${_printer}-lpr>=${pkgver}")
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}cupswrapper-${_version}.i386.deb")
md5sums=('2684e7dace3349bd32e0441566371839')

package() {
  ar x ${_printer}cupswrapper-${_version}.i386.deb || return 1
  tar -xf data.tar.gz -C "${pkgdir}" || return 1
}
