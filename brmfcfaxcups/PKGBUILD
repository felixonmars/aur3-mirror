# Maintainer: Carl Schaefer <schaefer:at:trilug.org>
# Contributer: SeÃ¡n Sloane <urbanmad:at:gmail.com>
pkgname=brmfcfaxcups
pkgver=1.0.0
pkgrel=1.1
pkgdesc="PC-FAX support for Brother (brpcfax)"
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=(GPL2)
depends=(cups)
[[ $CARCH == "x86_64" ]] && depends+=(lib32-glibc)
optdepends=(java-runtime)
install=$pkgname.install
source=(http://www.brother.com/pub/bsc/linux/dlf/brmfcfaxlpd-$pkgver-1.i386.rpm
	http://www.brother.com/pub/bsc/linux/dlf/brmfcfaxcups-$pkgver-1.i386.rpm)
sha256sums=(20c40c928aaf443b0b9e558df5c0075704648e8ba79816679307ee11d047ad1a
	    176f45374cc9ba0a4aa2cd19162d68f0a3d9b274cedae1f5ece2c3d13b570b72)

build() {
	# printcap is managed by CUPS now
	rm usr/local/Brother/inf/setupPrintcap

	# this directory extracts with mode 644
	chmod 700 var/spool/lpd/BRFAX
}

package() {
	tar cf - usr var | tar xpf - -C $pkgdir
}
