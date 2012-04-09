# Maintainer: Emmanuel GAUDE <gaude.emmanuel@gmail.com>

pkgname="brother-mfc-j5910dw-cupswrapper"
pkgver=1.1.3
_revision=1
pkgrel=1
pkgdesc="Cupswrapper driver for the Brother MFC-J5910DW printer"

url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-J5910DW"
license=('GPL2')

source=("http://www.brother.com/pub/bsc/linux/dlf/mfcj5910dwcupswrapper-${pkgver}-${_revision}.i386.deb")
md5sums=('bf10259e0bad7336f8be3407a560984b')
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript' "brother-mfc-j5910dw-lpr>=${pkgver}-${pkgrel}")
install=${pkgname}.install

package() {
  cd $srcdir
  ar x mfcj5910dwcupswrapper-${pkgver}-${_revision}.i386.deb || return 1

  tar -xzvf $srcdir/data.tar.gz -C $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
