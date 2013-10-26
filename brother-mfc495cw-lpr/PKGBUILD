# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com>

_printer=mfc495cw
pkgname=brother-${_printer}-lpr
pkgver=1.1.3_1
_version=${pkgver//_/-}
pkgrel=1
pkgdesc="LPR driver for Brother MFC-495CW multifunction network printer"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#MFC-495CW"
license=('GPL')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_printer}lpr-${_version}.i386.deb")
md5sums=('f6a26bed02c70438ccb308422d2b4d87')

package () {
	ar x ${_printer}lpr-${_version}.i386.deb || return 1
        tar -xf data.tar.gz -C ${pkgdir} || return 1
	mkdir -p ${pkgdir}/usr/lib/cups/filter
	ln -s /opt/brother/Printers/mfc495cw/lpd/filtermfc495cw ${pkgdir}/usr/lib/cups/filter/brlpdwrappermfc495cw
}
